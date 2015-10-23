/**
* Gemini Library v1.0.0
* http://www.jooyandeh.com/
* Copyright 2012, Mohammadreza Jooyandeh
*
* Copyright (C) 2011 - 2013 by Mohammadreza Jooyandeh
*
* All rights reserved. Permission is hereby given for use and/or distribution
* with the exception of sale for profit or application with non military
* significance. You must not remove this copyright notice, and you must
* document any changes that you make to this program. This software is subject
* to this copyright only, irrespective of any copyright attached to any package
* of which this is a part. Absolutely no guarantees or warranties are made
* concerning the suitability, correctness, or any other aspect of this program.
* Any use is at your own risk.
*/

if (typeof (Gemini) == "undefined")
	Gemini = {};
if (typeof (Gemini.Combinatorics) == "undefined")
	Gemini.Combinatorics = {};

Gemini.Combinatorics.PlaneEdge = function () {
	this.Start = undefined;
	this.End = undefined;
	this.Index = undefined;

	this.RightFace = undefined;

	this.Next = undefined;
	this.Prev = undefined;
	this.Inverse = undefined;

	this.GetNextOnFace = function () {
		return this.Inverse.Prev;
	}
	this.GetPrevOnFace = function () {
		return this.Prev.Inverse;
	}

	var mark;

	this.Mark = function () {
		mark = 1;
	}

	this.Unmark = function () {
		mark = 0;
	}

	this.IsMarked = function () {
		return mark == 1;
	}
}

Gemini.Combinatorics.Face = function () {
	this.Index = undefined;
	this.StartEdge = undefined;
	this.Size = undefined;

	this.GetEdges = function () {
		var edges = [];
		var e = this.StartEdge;
		do {
			edges.push(e);
			e = e.GetNextOnFace();
		} while (e != this.StartEdge);

		return edges;
	}

	this.GetVertices = function () {
		var vertices = [];
		var e = this.StartEdge;
		do {
			vertices.push(e.Start);
			e = e.GetNextOnFace();
		} while (e != this.StartEdge);

		return vertices;
	}
}

Gemini.Combinatorics.PlaneGraph = function () {
	this.VertexCount = 0;
	this.EdgeCount = 0;
	this.FaceCount = 0;

	this.Edges = undefined;
	this.FirstEdge = undefined;
	this.Degrees = undefined;
	this.Faces = undefined;

	this.HasLoop = function () {
		for (var i in this.Edges) {
			var e = this.Edges[i];
			if (e.Start = e.End)
				return true;
		}
	}

	this.ComputeFaces = function () {
		if (this.Faces)
			return;

		this.Faces = new Array(2 - this.VertexCount + this.EdgeCount / 2);

		this.ResetMarks();

		this.FaceCount = 0;

		for (var i = 0; i < this.VertexCount; i++) {
			var firstEdge = this.FirstEdge[i];
			var e = firstEdge;

			do {
				if (!e.IsMarked()) {
					var f = new Gemini.Combinatorics.Face();
					f.StartEdge = e;
					f.Index = this.FaceCount;

					var faceSize = 1;

					e.Mark();
					e.RightFace = f.Index;
					for (var ef = e.GetNextOnFace(); ef != e; ef = ef.GetNextOnFace()) {
						ef.Mark();
						ef.RightFace = f.Index;
						faceSize++;
					}

					f.Size = faceSize;

					this.Faces[this.FaceCount++] = f;
				}

				e = e.Next;
			} while (e != firstEdge);
		}
	}

	this.Clone = function () {
		var g = new Gemini.Combinatorics.PlaneGraph();
		g.VertexCount = this.VertexCount;
		g.EdgeCount = this.EdgeCount;
		g.Degrees = new Array(this.VertexCount);
		g.FirstEdge = new Array(this.VertexCount);
		g.Edges = new Array(this.EdgeCount);

		for (var i = 0; i < this.EdgeCount; i++) {
			var e = this.Edges[i];
			e.Index = i;
			var eClone = new Gemini.Combinatorics.PlaneEdge();
			eClone.Start = e.Start;
			eClone.End = e.End;
			eClone.Index = i;
			g.Edges[i] = eClone;
		}

		for (var i = 0; i < this.EdgeCount; i++) {
			var e = g.Edges[i];
			var eOld = this.Edges[e.Index];
			t = eOld;
			e.Next = g.Edges[eOld.Next.Index];
			e.Prev = g.Edges[eOld.Prev.Index];
			e.Inverse = g.Edges[eOld.Inverse.Index];
		}

		for (var v = 0; v < this.VertexCount; v++) {
			g.Degrees[v] = this.Degrees[v];
			g.FirstEdge[v] = g.Edges[this.FirstEdge[v].Index];
		}

		return g;
	}

	this.ResetMarks = function () {
		for (var i in this.Edges) {
			var e = this.Edges[i];
			e.Unmark();
		}
	}

	this.GetNeighbours = function (v) {
		var neighbours = [];
		var first = this.FirstEdge[v];
		var e = first;
		do {
			neighbours.push(e.End);
			e = e.Next;
		} while (e != first);

		return neighbours;
	}
}

Gemini.Combinatorics.PlaneGraph.FromIntCode = function (code) {
	var codeIndex = 0;
	if (!code)
		return null;

	var vertexCount = 0;
	for (; code[codeIndex] != ' '; codeIndex++)
		vertexCount = vertexCount * 10 + (code[codeIndex] - '0');

	var g = new Gemini.Combinatorics.PlaneGraph();
	g.VertexCount = vertexCount;
	g.Edges = [];
	g.FirstEdge = new Array(vertexCount);
	g.Degrees = new Array(vertexCount);
	for (var i = 0; i < vertexCount; i++)
		g.Degrees[i] = 0;

	for (var i = 0; i < vertexCount; i++) {
		var prevEdge = undefined;
		for (codeIndex++; code[codeIndex] != '0'; codeIndex += 2) {
			var neighbour;
			var cc = codeIndex;
			if (code[codeIndex + 1] == ' ')
				neighbour = code[codeIndex] - '0';
			else if (code[codeIndex + 2] == ' ') {
				neighbour = (code[codeIndex] - '0') * 10 + (code[codeIndex + 1] - '0');
				codeIndex++;
			}
			else {
				neighbour = (code[codeIndex] - '0') * 100 + (code[codeIndex + 1] - '0') * 10 + (code[codeIndex + 2] - '0');
				codeIndex += 2;
			}

			neighbour--;
			var e = new Gemini.Combinatorics.PlaneEdge();
			e.Start = i;
			e.End = neighbour;
			e.Prev = prevEdge;

			if (prevEdge)
				prevEdge.Next = e;
			else
				g.FirstEdge[i] = e;

			prevEdge = e;

			g.Edges.push(e);
			g.EdgeCount++;
			g.Degrees[i]++;
		}

		codeIndex++;
		prevEdge.Next = g.FirstEdge[i];
		g.FirstEdge[i].Prev = prevEdge;
	}

	for (var i = 0; i < vertexCount; i++) {
		if (g.Degrees[i] == 0)
			continue;
		var e = g.FirstEdge[i];
		var eLast = e;

		do {
			if (!e.Inverse) {
				var ee = g.FirstEdge[e.End];
				var eeLast = ee;
				if (ee) {
					do {
						if ((ee.End == i) && (!ee.Inverse))
							break;
						ee = ee.Next;
					} while (ee != eeLast);

					if ((ee) && (ee.End == i) && (!ee.Inverse)) {
						e.Inverse = ee;
						ee.Inverse = e;
					}
				}
			}
			e = e.Next;
		} while (e != eLast);
	}

	return g;
}
