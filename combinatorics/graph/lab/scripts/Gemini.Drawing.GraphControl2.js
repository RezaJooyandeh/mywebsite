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
if (typeof (Gemini.Drawing) == "undefined")
	Gemini.Drawing = {};

Gemini.Drawing.GraphControl = function (containerId, controlSize) {
	this.DefaultVertexShapeDiameter = 12;
	this.DefaultVertexShapeFillStyle = "#4169E1";
	this.DefaultEdgeShapeWidth = 3;
	this.DefaultEdgeStrokeStyle = "#9ACD32"

	var padding = new Gemini.Drawing.Padding(0, 0, 0, 0);
	var size = controlSize;
	vertexShapeDiameter = this.DefaultVertexShapeDiameter;
	vertexShapeFillStyle = this.DefaultVertexShapeFillStyle;
	edgeShapeWidth = this.DefaultEdgeShapeWidth;
	edgeStrokeStyle = this.DefaultEdgeStrokeStyle;

	var toX = d3.scale.linear().range([vertexShapeDiameter, size.width - vertexShapeDiameter]);
	var toY = d3.scale.linear().range([vertexShapeDiameter, size.height - vertexShapeDiameter]);

	var graph = { VertexCount: 0, EdgeCount: 0, Edges: [] };
	var embedding;
	var planeGraph;

	var containerId;
	var control = this;

	var svgContainer = d3.select("#" + containerId)
		.append("svg")
		.attr("width", size.width)
		.attr("height", size.height)
		.attr("version", "1.1")
		.attr("xmlns", "http://www.w3.org/2000/svg")
		.append("g")
		.attr("transform", "translate(" + [padding.left, padding.top] + ")");

	var svgBackground = svgContainer.append("rect")
		.attr("x", "-5%")
		.attr("y", "-5%")
		.attr("width", "110%")
		.attr("height", "110%")
		.attr("fill", "none")
		.attr("pointer-events", "all")
		.on("click", emptyAreaClicked);
	var svgEdges = svgContainer.append("g")
		.attr("stroke", edgeStrokeStyle)
		.attr("stroke-width", edgeShapeWidth + "px")
		.attr("cursor", "move");
	var svgVertices = svgContainer.append("g")
		.attr("fill", vertexShapeFillStyle)
		.attr("cursor", "move");
	var svgVerticesLabel = svgContainer.append("g")
		.attr("style", "text-anchor: middle; dominant-baseline: central")
		.attr("cursor", "move");

	function update() {
		var edge = svgEdges.selectAll("line")
			.data(embedding.Edges);
		edge.enter()
			.append("line")
			.call(d3.behavior.drag()
				.origin(dragEdgeStart)
				.on("drag", dragEdgeMove));
		edge.exit()
			.remove();
		edge.attr("y2", function (d) { return toY(d[1][1]); })
			.attr("x2", function (d) { return toX(d[1][0]); })
			.attr("y1", function (d) { return toY(d[0][1]); })
			.attr("x1", function (d) { return toX(d[0][0]); });

		var vertex = svgVertices.selectAll("circle")
			.data(embedding.Vertices);
		vertex.enter().append("circle")
			.attr("r", vertexShapeDiameter - 1)
			.call(d3.behavior.drag()
				.origin(dragVertexStart)
				.on("drag", dragVertexMove)
			);
		vertex.exit()
			.remove();
		vertex.attr("cy", function (d) { return toY(d[1]); })
			.attr("cx", function (d) { return toX(d[0]); });

		var vertexLabel = svgVerticesLabel.selectAll("text")
			.data(embedding.Vertices);
		vertexLabel.enter().append("text");
		vertexLabel.exit().remove();
		vertexLabel.text(function (d, i) { return i + 1; })
			.attr("y", function (d) { return toY(d[1]); })
			.attr("x", function (d) { return toX(d[0]); })
			.attr("style", "fill: yellow")
			.call(d3.behavior.drag()
				.origin(dragVertexStart)
				.on("drag", dragVertexMove)
			);
	}

	function dragVertexStart(d) {
		return { x: toX(d[0]), y: toY(d[1]) };
	}

	function dragVertexMove(d) {
		d[0] = Math.max(0, Math.min(1, toX.invert(d3.event.x))) + Math.random() * 1e-4;
		d[1] = Math.max(0, Math.min(1, toY.invert(d3.event.y))) + Math.random() * 1e-4;
		update();
	}

	function dragEdgeStart(d) {
		return { x: toX(d[0][0]), y: toY(d[0][1]) };
	}

	function dragEdgeMove(d) {
		d[1][0] = Math.max(0, Math.min(1, toX.invert(d3.event.x) + d[1][0] - d[0][0])) + Math.random() * 1e-4;
		d[1][1] = Math.max(0, Math.min(1, toY.invert(d3.event.y) + d[1][1] - d[0][1])) + Math.random() * 1e-4;
		d[0][0] = Math.max(0, Math.min(1, toX.invert(d3.event.x))) + Math.random() * 1e-4;
		d[0][1] = Math.max(0, Math.min(1, toY.invert(d3.event.y))) + Math.random() * 1e-4;
		update();
	}

	function emptyAreaClicked(d, i) {
		var newOuterFace = findFaceAt([toX.invert(d3.svg.mouse(this)[0]), toY.invert(d3.svg.mouse(this)[1])]);
		updateEmbedding(newOuterFace, control.EmbeddingSettings);
	}

	function findFaceAt(point) {
		planeGraph.ComputeFaces();

		for (var fi in planeGraph.Faces) {
			var f = planeGraph.Faces[fi];

			var faceEdges = f.GetEdges();

			var isInFace = true;
			for (var ei in faceEdges) {
				var e = faceEdges[ei];

				var vsp = embedding.Vertices[e.Start];
				var vep = embedding.Vertices[e.End];

				var v1x = vep[0] - vsp[0];
				var v1y = vep[1] - vsp[1];
				var v2x = point[0] - (vep[0] + vsp[0]) / 2
				var v2y = point[1] - (vep[1] + vsp[1]) / 2;

				if (v1x * v2y - v1y * v2x < 0) {
					isInFace = false;
					break;
				}
			}

			if (isInFace)
				return f;
		}

		return null;
	}

	this.EmbeddingSettings = new Gemini.Combinatorics.PlaneGraphEmbbeder.Settings();
	var faceCenters;

	this.LoadFromPlaneGraph = function (g) {
		var ne = g.EdgeCount;
		graph.VertexCount = g.VertexCount;
		graph.EdgeCount = ne;
		graph.Edges = new Array(ne);
		g.Edges.forEach(function (edge, i) {
			graph.Edges[i] = [edge.Start, edge.End];
		});

		planeGraph = g;
		updateEmbedding(null, this.EmbeddingSettings);
	}

	function updateEmbedding(outerFace, settings) {
		var ne = graph.EdgeCount;

		var boundry = new Gemini.Drawing.Rect(0, 0, 1, 1);
		faceCenters = [];

		var verticesPosition = Gemini.Combinatorics.PlaneGraphEmbbeder.Embed(planeGraph, boundry, faceCenters, settings, outerFace);
		var edgesPosition = new Array(ne);
		graph.Edges.forEach(function (edge, i) {
			edgesPosition[i] = [verticesPosition[edge[0]], verticesPosition[edge[1]]];
		});
		embedding = { Vertices: verticesPosition, Edges: edgesPosition };
		update();
	}

	this.Clear = function () {
		graph.VertexCount = 0;
		graph.EdgeCount = 0;
		graph.Edges = [];
		embedding = { Vertices: [], Edges: [] };
		update();
	}
}
