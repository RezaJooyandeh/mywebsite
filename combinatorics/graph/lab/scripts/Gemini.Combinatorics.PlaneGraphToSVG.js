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
	Gemini.Combinatorics = {};

Gemini.Combinatorics.PlaneGraph.ToSVG = function (graph, positions, width, height) {
	var svg = [];
	svg.push("<svg width=\"", width.toString(), "\" height=\"", height.toString(), "\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\">", "\n\n\t<!-- Edges -->\n\n");

	for (var i = 0; i < graph.EdgeCount; i++) {
		var e = graph.Edges[i];

		svg.push("\t<line x1=\"", positions[e.Start][0].toString(), "\" y1=\"", positions[e.Start][1].toString(), "\" x2=\"", positions[e.End][0].toString(), "\" y2=\"", positions[e.End][1].toString(), "\" style=\"stroke:rgb(0,0,0);stroke-width:4\" />\n");
	}

	svg.push("\n\n\t<!-- Vertices -->\n\n");

	//for (var v = 0; v < graph.VertexCount; v++) {
	for (var v = graph.VertexCount - 1; v >= 0; v--) {
		svg.push("\t<circle cx=\"", positions[v][0], "\" cy=\"", positions[v][1], "\" r=\"2\" style=\"fill:rgb(255,200,100);stroke:rgb(0,0,0);stroke-width:1\"/>\n");
	}

	svg.push("</svg>\n");

	return svg.join("");
}