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

Gemini.Combinatorics.PlaneGraphEmbbeder = {};

Gemini.Combinatorics.PlaneGraphEmbbeder.Settings = function () {
	this.isOuterFaceBiggest = true;
	this.putOuterFaceOnCircle = true;
}

Gemini.Combinatorics.PlaneGraphEmbbeder.Embed = function (g, boundary, faceCenters, settings, outerFace) {
	var gClone = g.Clone();
	gClone.ComputeFaces();

	if (outerFace)
		outerFace = gClone.Faces[outerFace.Index];
	else {
		outerFace = gClone.Faces[0];
		if (settings.isOuterFaceBiggest) {
			for (var i in gClone.Faces) {
				var f = gClone.Faces[i];
				if (f.Size > outerFace.Size)
					outerFace = f;
			}
		}
		else {
			for (var i in gClone.Faces) {
				var f = gClone.Faces[i];
				if (f.Size < outerFace.Size)
					outerFace = f;
			}
		}
	}

	for (var i in gClone.Faces) {
		var f = gClone.Faces[i];

		if (f == outerFace)
			continue;
		if (f.Size == 3)
			continue;

		var v = gClone.VertexCount;
		var lastFromV = null;
		var d = 0;
		var faceEdges = f.GetEdges();
		for (var i in faceEdges) {
			var e = faceEdges[i];
			var toV = new Gemini.Combinatorics.PlaneEdge();
			toV.Start = e.Start;
			toV.End = v;
			toV.Next = e.Next;
			toV.Prev = e;
			toV.Next.Prev = toV;
			toV.Prev.Next = toV;
			gClone.Degrees[toV.Start]++;

			var fromV = new Gemini.Combinatorics.PlaneEdge();
			fromV.Start = v;
			fromV.End = e.Start;
			fromV.Prev = lastFromV;
			if (lastFromV != null)
				lastFromV.Next = fromV;
			else
				gClone.FirstEdge.push(fromV);
			lastFromV = fromV;
			d++;
			gClone.Edges.push(toV);
			gClone.Edges.push(fromV);
			toV.Inverse = fromV;
			fromV.Inverse = toV;
		}
		gClone.Degrees.push(d);
		lastFromV.Next = gClone.FirstEdge[v];
		gClone.FirstEdge[v].Prev = lastFromV;
		gClone.VertexCount++;
	}

	var a = new Array(gClone.VertexCount);
	var b = new Array(gClone.VertexCount);
	for (var i = 0; i < gClone.VertexCount; i++) {
		a[i] = new Array(gClone.VertexCount);
		for (var j = 0; j < gClone.VertexCount; j++)
			a[i][j] = 0;
	}

	var addedVertices = new Array(gClone.VertexCount);
	var faceVertices = outerFace.GetVertices();
	var vi = 0;
	var verticesBFS = [];
	var verticesBFSVisit = new Array(gClone.VertexCount);

	var startAngle = 0;
	var width = boundary.width;
	var height = boundary.height;
	var left = boundary.left;
	var top = boundary.top;

	if ((faceVertices.length >= 4) && (!settings.putOuterFaceOnCircle)) {
		var k = Math.floor(faceVertices.length / 4);
		var k1, k2, k3, k4;
		switch (faceVertices.length % 4) {
			case 0:
				k1 = k2 = k3 = k4 = k;
				break;
			case 1:
				k2 = k3 = k4 = k;
				k1 = k + 1;
				break;
			case 2:
				k1 = k3 = k;
				k2 = k4 = k + 1;
				break;
			case 3:
				k3 = k;
				k1 = k2 = k4 = k + 1;
				break;
		}

		for (var i in faceVertices) {
			var v = faceVertices[i];
			a[v][v] = 1;
			addedVertices[v] = true;
			vi++;
			verticesBFS.push(v);
			verticesBFSVisit[v] = 1;
		}
		var vi = faceVertices.length - 1;
		switch (faceVertices.length % 4) {
			case 0:
				//vi += k4;
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
		}

		vi += Math.floor(k1 / 2) + 1;
		var mod = faceVertices.length;
		for (var i = 0; i < k1; i++)
			b[faceVertices[vi-- % mod]] = [1.0 * i / k1, 0];
		for (var i = 0; i < k2; i++)
			b[faceVertices[vi-- % mod]] = [1, 1.0 * i / k2];
		for (var i = 0; i < k3; i++)
			b[faceVertices[vi-- % mod]] = [1 - 1.0 * i / k3, 1];
		for (var i = 0; i < k4; i++)
			b[faceVertices[vi-- % mod]] = [0, 1 - 1.0 * i / k4];
	}
	else {
		for (var i in faceVertices) {
			var v = faceVertices[i];
			a[v][v] = 1;
			b[v] = [(Math.sin(-2 * Math.PI * vi / outerFace.Size + startAngle) + 1) * width / 2 + left, (1 - Math.cos(-2 * Math.PI * vi / outerFace.Size + startAngle)) * height / 2 + top];
			if (b[v][0] < 0.000000001)
				b[v][0] = 0;
			if (b[v][1] < 0.000000001)
				b[v][1] = 0;
			addedVertices[v] = true;
			vi++;
			verticesBFS.push(v);
			verticesBFSVisit[v] = 1;
		}
	}

	var head = 0;
	while (head < verticesBFS.length) {
		var neighbours = gClone.GetNeighbours(verticesBFS[head]);
		for (var i in neighbours) {
			var n = neighbours[i];
			if (!verticesBFSVisit[n]) {
				verticesBFSVisit[n] = verticesBFSVisit[v] + 1;
				verticesBFS.push(n);
			}
		}
		head++;
	}

	for (var v = 0; v < gClone.VertexCount; v++) {
		if (addedVertices[v])
			continue;

		var sum = 0;
		var neighbours = gClone.GetNeighbours(v);
		for (var i in neighbours) {
			var n = neighbours[i];
			a[v][n] = 1;
			//a[v][n] = 1 * (gClone.VertexCount - verticesBFSVisit[n] + 1)* (gClone.VertexCount - verticesBFSVisit[n] + 1)* (gClone.VertexCount - verticesBFSVisit[n] + 1)* (gClone.VertexCount - verticesBFSVisit[n] + 1);
			a[v][n] = Math.pow(3, -verticesBFSVisit[n] * verticesBFSVisit[n]);
			//a[v][n] = 1.0 / (verticesBFSVisit[n] * verticesBFSVisit[n] * verticesBFSVisit[n] * verticesBFSVisit[n]);
			sum += a[v][n];
		}

		a[v][v] = -sum;
		b[v] = [0, 0];
		addedVertices[v] = true;
	}

	var result = new Array(g.VertexCount);

	var matrixA = new Array(gClone.VertexCount);
	var matrixB = new Array(gClone.VertexCount);
	for (var i = 0; i < gClone.VertexCount; i++) {
		matrixA[i] = new Array(gClone.VertexCount);
		for (var j = 0; j < gClone.VertexCount; j++) {
			matrixA[i][j] = [a[i][j], 1];
		}
		var s0 = new String(b[i][0]);
		var b0;
		if (s0.indexOf(".") == -1)
			b0 = [b[i][0], 1];
		else if (s0.indexOf("e") == -1)
			b0 = float2frac(s0);
		else
			b0 = scientific2frac(s0);

		matrixB[i] = [b0];
	}

	var matrixX = solve_lineq(matrixA, matrixB);
	for (var i = 0; i < g.VertexCount; i++) {
		var x = matrixX[i][0][0] * 1.0 / matrixX[i][0][1];
		result[i] = [x, 0];
	}

	for (var i = 0; i < gClone.VertexCount; i++) {
		for (var j = 0; j < gClone.VertexCount; j++) {
			matrixA[i][j] = [a[i][j], 1];
		}
		var s1 = new String(b[i][1]);
		var b1;
		if (s1.indexOf(".") == -1)
			b1 = [b[i][1], 1];
		else if (s0.indexOf("e") == -1)
			b1 = float2frac(s1);
		else
			b1 = scientific2frac(s1);

		matrixB[i] = [b1];
	}

	var matrixY = solve_lineq(matrixA, matrixB);
	for (var i = 0; i < g.VertexCount; i++) {
		var y = matrixY[i][0][0] * 1.0 / matrixY[i][0][1];
		result[i][1] = y;
	}

	if (faceCenters) {
		var adjustmentIndex = 0;
		for (var i = 0; i < gClone.FaceCount; i++) {
			var f = gClone.Faces[i];

			if (f == outerFace) {
				faceCenters.push(null);
				adjustmentIndex--;
			}
			else if (f.Size == 3) {
				var x = (result[f.StartEdge.Start][0] + result[f.StartEdge.End][0] + result[f.StartEdge.Inverse.Prev.End][0]) / 3.0;
				var y = (result[f.StartEdge.Start][1] + result[f.StartEdge.End][1] + result[f.StartEdge.Inverse.Prev.End][1]) / 3.0;
				faceCenters.push([x, y]);
				adjustmentIndex--;
			}
			else {
				var x = matrixX[i + g.VertexCount + adjustmentIndex][0][0] * 1.0 / matrixX[i + g.VertexCount + adjustmentIndex][0][1];
				var y = matrixY[i + g.VertexCount + adjustmentIndex][0][0] * 1.0 / matrixY[i + g.VertexCount + adjustmentIndex][0][1];
				faceCenters.push([x, y]);
			}
		}
	}

	return result;
}
