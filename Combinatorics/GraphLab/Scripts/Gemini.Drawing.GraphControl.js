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

Gemini.Drawing.GraphControl = function () {
	function Vertex() {
		this.label = null;
		this.position = new Gemini.Drawing.Point(0, 0);
		this._element = undefined;
		this.getIndex = function () { return this._element.index; }
	}

	function Vertex(x, y) {
		this.label = null;
		this.position = new Gemini.Drawing.Point(x, y);
		this._element = undefined;
		this.getIndex = function () { return this._element.index; }
	}

	function Vertex(x, y, label) {
		this.label = label;
		this.position = new Gemini.Drawing.Point(x, y);
		this._element = undefined;
		this.getIndex = function () {
			return this._element.index;
		}
	}

	function VertexShape(position, diameter, fillStyle, graphControl) {
		this.mouseover = undefined;
		this.mouseout = undefined;
		this.click = undefined;
		this.dblclick = undefined;

		this.vertexData = undefined;
		this.position = position;

		this.circle = undefined;

		this.updatePosition = function () {
			this.circle.setX(this.position.x);
			this.circle.setY(this.position.y);
		}

		var that = this;

		this.circle = new Kinetic.Circle({
			radius: diameter,
			fill: fillStyle,
			stroke: "black",
			strokeWidth: 1,
			draggable: true
		});

		this.updatePosition();

		this.circle.on("mouseover", function () {
			document.body.style.cursor = "pointer";
			graphControl.statusBar.setText((that.vertexData.index + 1).toString());
			graphControl.statusBar.getLayer().draw();

			if (that.mouseover)
				that.mouseover(that);
		});

		this.circle.on("mouseout", function () {
			document.body.style.cursor = "default";
			graphControl.statusBar.setText("");
			graphControl.statusBar.getLayer().draw();
			if (that.mouseout)
				that.mouseout(that);
		});

		this.circle.on("click", function (evt) {
			if (that.click)
				that.click(that);

			evt.cancelBubble = true;
		});

		var oldPos = new Gemini.Drawing.Point(0, 0);
		this.circle.on("mousedown", function (eventInfo) {
			oldPos.x = this.getX();
			oldPos.y = this.getY();
		});

		var newPos = new Gemini.Drawing.Point(0, 0);
		var movingVector = new Gemini.Drawing.Vector(0, 0);
		this.circle.on("dragmove", function (eventInfo) {
			var v = that.vertexData.vertex._element.index;
			newPos.x = this.getX();
			newPos.y = this.getY();
			movingVector.x = newPos.x - oldPos.x;
			movingVector.y = newPos.y - oldPos.y;
			graphControl.vertexMoved(that.vertexData.vertex, movingVector);
			oldPos.x = newPos.x;
			oldPos.y = newPos.y;
			this.circle.getLayer().draw();
		});

		var oldContainer;
		this.setContainer = function (container) {
			if (oldContainer)
				oldContainer.remove(this.circle);

			if (container)
				container.add(this.circle);
			oldContainer = container;
		}
	}

	function ObjectLabel(label, position, size) {
		this.text = label;
		this.size = size;
		this.position = new Gemini.Drawing.Point(position.x, position.y);
		//this.TextAlignment = TextAlignment.Center;
		this.elementData = undefined;

		var that = this;
		this.label = new Kinetic.Shape({
			drawFunc: function () {
				var context = this.getContext();
				context.beginPath();
				context.font = "14pt Calibri";
				context.fillStyle = "black";
				context.textBaseline = "top";
				context.fillText(that.text, position.x, position.y);
			}
		});

		var oldContainer;
		this.setContainer = function (container) {
			if (oldContainer)
				oldContainer.remove(this.label);

			if (container)
				container.add(this.label);
			oldContainer = container;
		}
	}

	function EdgeShape(v1, v2, thickness, strokeStyle) {
		this.v1 = v1;
		this.v2 = v2;
		/*
		this.thickness = thickness;
		this.strokeStyle = strokeStyle;
		//*/
		this.elementData = undefined;
		this.line = undefined;
		var that = this;

		var shiftPosition = new Gemini.Drawing.Vector(0, 0);
		this.setPoints = function () {
			this.line.setPoints([this.v1.position.x - shiftPosition.x, this.v1.position.y - shiftPosition.y, this.v2.position.x - shiftPosition.x, this.v2.position.y - shiftPosition.y]);
		}

		this.line = new Kinetic.Line({
			stroke: strokeStyle,
			strokeWidth: thickness,
			lineCap: "round",
			lineJoin: "round",
			draggable: true
		});

		this.setPoints();

		this.line.on("mouseover", function () {
			document.body.style.cursor = "pointer";
		});
		this.line.on("mouseout", function () {
			document.body.style.cursor = "default";
		});

		var oldPos = new Gemini.Drawing.Point(0, 0);
		this.line.on("mousedown", function (eventInfo) {
			oldPos.x = this.getX();
			oldPos.y = this.getY();
		});

		var newPos = new Gemini.Drawing.Point(0, 0);
		var movingVector = new Gemini.Drawing.Vector(0, 0);
		this.line.on("dragmove", function (eventInfo) {
			newPos.x = this.getX();
			newPos.y = this.getY();
			movingVector.x = newPos.x - oldPos.x;
			movingVector.y = newPos.y - oldPos.y;
			shiftPosition.x += movingVector.x;
			shiftPosition.y += movingVector.y;
			graphControl.moveVertex(that.v1, movingVector, that);
			graphControl.moveVertex(that.v2, movingVector, that);
			oldPos.x = newPos.x;
			oldPos.y = newPos.y;
			that.line.getLayer().draw();

			var pts = that.line.getPoints();
		});

		var oldContainer;
		this.setContainer = function (container) {
			if (oldContainer)
				oldContainer.remove(this.line);

			if (container)
				container.add(this.line);
			oldContainer = container;
		}
	}

	function VertexShapeData() {
		this.vertex = undefined;
		this.label = undefined;
		this.shape = undefined;
		this.index = undefined;
	}

	function EdgeShapeData() {
		this.shape = undefined;
		this.v1 = undefined;
		this.v2 = undefined;
		this.label = undefined;
	}

	function EdgeShapeData(shape, v1, v2, label) {
		this.shape = shape;
		this.v1 = v1;
		this.v2 = v2;
		this.label = label;
	}

	this.getAdjancecy = function (v1, v2) { return _adjancecy[v1][v2]; }
	this.setAdjancecy = function (v1, v2, value) {
		if (this._adjancecy[v1][v2] != value) {
			this._adjancecy[v1][v2] = value;
			this._adjancecy[v2][v1] = value;
			if (value == 1)
				this._addEdgeInternal(v1, v2);
			else
				this._removeEdgeInternal(v1, v2);
		}
	}

	this.SetEdgeLabel = function (v1, v2, label) {
		// EdgesData[v1][v2].Label.Text = label;
	}

	this.vertices = [];
	this.selectedElement = undefined;
	this._adjancecy = [];
	this.verticesData = [];
	this.edgesData = [];
	this._canvasChildren = [];
	//this.vertexCount = function () { return vertices.length; }

	this.DefaultVertexShapeDiameter = 4;
	this.DefaultVertexShapeFillStyle = "#4169E1";
	this.DefaultEdgeShapeWidth = 3;
	this.DefaultEdgeStrokeStyle = "#9ACD32"

	this.vertexShapeDiameter = this.DefaultVertexShapeDiameter;
	this.vertexShapeFillStyle = this.DefaultVertexShapeFillStyle;
	this.edgeShapeWidth = this.DefaultEdgeShapeWidth;
	this.edgeStrokeStyle = this.DefaultEdgeStrokeStyle;

	this.selectedEdgeFillBrush = undefined;
	this.selectedVertexFillBrush = undefined;

	this.vertexLabelSize = new Gemini.Drawing.Size(this.vertexShapeDiameter, this.vertexShapeDiameter);

	this._insertVertexInternal = function (vertex, index) {
		var point = vertex.position;
		var vertexShape = new VertexShape(vertex.position, this.vertexShapeDiameter, this.vertexShapeFillStyle, this);
		//Panel.SetZIndex(vertexShape, 1);
		//vertexShape.MouseLeftButtonDown += new MouseButtonEventHandler(Vertex_MouseLeftButtonDown);
		this._canvasChildren.push(vertexShape);

		var vertexLabel = new ObjectLabel(vertex.label, vertex.position, this.vertexLabelSize);
		//vertexLabel.MouseLeftButtonDown += new MouseButtonEventHandler(Vertex_MouseLeftButtonDown);
		//Panel.SetZIndex(vertexLabel, 2);
		this._canvasChildren.push(vertexLabel);

		var vertexData = new VertexShapeData();
		vertexData.shape = vertexShape;
		vertexData.index = index;
		vertexData.label = vertexLabel;
		vertexData.vertex = vertex;

		vertexShape.vertexData = vertexData;
		vertexLabel.elementData = vertexData;
		vertex._element = vertexData;
		this.verticesData.splice(index, 0, vertexData);
	}

	this._addEdgeInternal = function (v1, v2) {
		var edgeShape = new EdgeShape(this.vertices[v1], this.vertices[v2], this.edgeShapeWidth, this.edgeStrokeStyle);

		var edgeLabel = undefined; //new ObjectLabel('', new Gemini.Drawing.Point(vertices[v1].position.x + vertices[v2].position.x) / 2, (vertices[v1].position.y + vertices[v2].position.y) / 2, undefined);
		//edgeLabel.VerticalAlignment = VerticalAlignment.Center;
		//edgeLabel.MouseLeftButtonDown += new MouseButtonEventHandler(Edge_MouseLeftButtonDown);
		//edgeLabel.TextAlignment = TextAlignment.Center;
		//edgeLabel.Foreground = Brushes.Black;
		//Panel.SetZIndex(edgeLabel, 2);
		//this._canvasChildren.push(edgeLabel);

		var edge = new EdgeShapeData(edgeShape, Math.min(v1, v2), Math.max(v1, v2), edgeLabel);
		this.edgesData[v1][v2] = edge;
		this.edgesData[v2][v1] = edge;

		edge.shape.elementData = edge;
		//edgeLabel.elementData = EdgeShapeData;
		this._canvasChildren.push(edgeShape);
		//path.MouseLeftButtonDown += new MouseButtonEventHandler(Edge_MouseLeftButtonDown);
	}

	this.removeEdgeInternal = function (v1, v2) {
		if (adjancecy[v1][v2] != 0) {
			var edgeShape = edgesData[v1][v2];

			_canvasChildren.splice(_canvasChildren.indexOf(edgeShape.shape), 1);
			_adjancecy[v1][v2] = 0;
			_adjancecy[v2][v1] = 0;
			edgesData[v1][v2] = undefined;
			edgesData[v2][v1] = undefined;
		}
	}

	this.addVertex = function (vertex, index) {
		this.vertices.push(vertex);
		this.vertices_CollectionChanged_Insert(vertex, index);
	}

	this.vertices_CollectionChanged_Insert = function (vertex, index) {
		var lstNewRow = new Array(this.vertexCount);
		var lstEdgesRow = new Array(this.vertexCount);
		this._adjancecy.splice(index, 0, lstNewRow);
		this.edgesData.splice(index, 0, lstEdgesRow);
		for (var i = 1; i < this.vertexCount; i++) {
			this._adjancecy[index].push(0);
			lstEdgesRow.push(undefined);
		}
		for (var i = 0; i < this.vertexCount; i++) {
			this._adjancecy[i].splice(index, 0, 0);
			this.edgesData[i].splice(index, 0, undefined);
		}

		this._insertVertexInternal(vertex, index);
	}

	this.vertices_CollectionChanged_RemoveVertex = function (index) {
		var vertexCount = vertices.length;

		var vertexShape = verticesData[index].shape;
		_canvasChildren.splice(_canvasChildren.indexOf(vertexShape), 1);

		_adjancecy.splice(index, 1);
		verticesData.splice(index, 1);
		edgesData.splice(index, 1);

		for (var i = 0; i < vertexCount; i++) {
			var edgeShape = EdgesData[i][index].shape;
			if (edgeShape != undefined)
				_canvasChildren.splice(_canvasChildren.indexOf(edgeShape), 1);

			edgesData[i].splice(index, 1);
			_adjancecy[i].splice(index, 1);
		}
	}

	this.Vertices_CollectionChanged_Clear = function () {
		_adjancecy.length = 0;
		verticesData.length = 0;
		edgesData.length = 0;
		_canvasChildren.length = 0;
	}

	this.moveVertex = function (vertex, vector, edgeShape) {
		//*
		var v = vertex._element.index;
		this.vertices[v].position.x = this.vertices[v].position.x + vector.x;
		this.vertices[v].position.y = this.vertices[v].position.y + vector.y;
		this.vertices[v]._element.shape.updatePosition();

		for (var w = 0; w < this.verticesData.length; w++) {
			var edgeData = this.edgesData[v][w];
			if (edgeData) {
				if (edgeData.shape != edgeShape)
					edgeData.shape.setPoints();
			}
		}
		//*/
	}

	this.vertexMoved = function (vertex, vector) {
		//*
		var v = vertex._element.index;
		this.vertices[v].position.x = this.vertices[v].position.x + vector.x;
		this.vertices[v].position.y = this.vertices[v].position.y + vector.y;

		for (var w = 0; w < this.verticesData.length; w++) {
			var edgeData = this.edgesData[v][w];
			if (edgeData)
				edgeData.shape.setPoints();
		}
		//*/
	}

	this.keyCode = undefined;

	this.statusBar = new Kinetic.Text({
		x: 10,
		y: 10,
		text: 'Simple Text',
		fontSize: 12,
		fontFamily: 'Calibri',
		textFill: 'black'
	});

	this.embeddingSettings = new Gemini.Combinatorics.PlaneGraphEmbbeder.Settings();

	this.loadGraph = function (g, region, outerFace) {
		var that = this;
		var faceCenters = []
		var positions = Gemini.Combinatorics.PlaneGraphEmbbeder.Embed(g, region, faceCenters, this.embeddingSettings, outerFace);
		for (var i = 0; i < g.VertexCount; i++) {
			var v = new Vertex(positions[i][0], positions[i][1], i + 1);
			this.addVertex(v, i);
		}

		for (var v = 0; v < g.VertexCount; v++) {
			var neighbours = g.GetNeighbours(v);
			for (var j in neighbours) {
				var n = neighbours[j];
				if (v < n)
					this.setAdjancecy(v, n, 1);
			}
		}
	}

	this.clearGraph = function () {
		this.setContainer(null, null);
		this.vertices = [];
		this.selectedElement = undefined;
		this._adjancecy = [];
		this.verticesData = [];
		this.edgesData = [];
		this._canvasChildren = [];
	}

	var oldToolboxContainer;
	this.setContainer = function (shapesContainer, labelsLayer, toolboxContainer) {
		for (var i = this._canvasChildren.length - 1; i >= 0; i--)
			this._canvasChildren[i].setContainer(shapesContainer);

		if (toolboxContainer)
			toolboxContainer.add(this.statusBar);
		if (oldToolboxContainer)
			oldToolboxContainer.remove(this.statusBar);
		oldToolboxContainer = toolboxContainer;
	}

	this.containerSize;
	this.containerPadding;

	var stage;
	var shapesLayer;
	var toolboxLayer;
	var backgroundLayer;

	this.load = function (containerId, containerSize, containerPadding) {
		this.containerSize = containerSize;
		this.containerPadding = containerPadding;
		var that = this;

		stage = new Kinetic.Stage({
			container: containerId,
			width: this.containerSize.width,
			height: this.containerSize.height
		});

		verticesLayer = new Kinetic.Layer();
		edgesLayer = new Kinetic.Layer();
		shapesLayer = new Kinetic.Layer();
		toolboxLayer = new Kinetic.Layer();
		labelsLayer = new Kinetic.Layer();
		backgroundLayer = new Kinetic.Layer();

		var rect = new Kinetic.Rect({
			x: 0,
			y: 0,
			width: stage.getWidth(),
			height: stage.getHeight(),
			stroke: 0
		});

		rect.on('click', function () {
			var mousePos = stage.getMousePosition();
			var x = mousePos.x;
			var y = mousePos.y;

			if (that.graph) {
				var face = that.findFaceAt(new Gemini.Drawing.Point(x, y));
				that.clearGraph();
				stage.draw();
				that.loadGraph(that.graph, that.region, face);
				that.setContainer(shapesLayer, labelsLayer, toolboxLayer);
				shapesLayer.draw();
			}
		});

		backgroundLayer.add(rect);

		stage.add(backgroundLayer);
		stage.add(toolboxLayer);
		stage.add(shapesLayer);
		stage.add(verticesLayer);
		stage.add(edgesLayer);
		stage.add(labelsLayer);
	}

	this.findFaceAt = function (point) {
		this.graph.ComputeFaces();

		for (var fi in this.graph.Faces) {
			var f = this.graph.Faces[fi];

			var faceEdges = f.GetEdges();

			var isInFace = true;
			for (var ei in faceEdges) {
				var e = faceEdges[ei];

				var vsp = this.vertices[e.Start].position;
				var vep = this.vertices[e.End].position;

				var v1x = vep.x - vsp.x;
				var v1y = vep.y - vsp.y;
				var v2x = point.x - (vep.x + vsp.x) / 2
				var v2y = point.y - (vep.y + vsp.y) / 2;

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

	this.click = undefined;

	this.clear = function () {
		this.clearGraph();
		stage.draw();
	}

	this.graph = undefined;
	this.region;

	this.read = function (graph_code) {
		this.graph = Gemini.Combinatorics.PlaneGraph.FromIntCode(graph_code);

		this.region = new Gemini.Drawing.Rect(this.containerPadding.left, this.containerPadding.top, this.containerSize.width - (this.containerPadding.left + this.containerPadding.right), this.containerSize.height - (this.containerPadding.top + this.containerPadding.bottom));
		this.clearGraph();
		stage.draw();
		this.loadGraph(this.graph, this.region, undefined);

		/*
		window.onkeydown = function(evt) {
		graphControl.keyCode = evt.keyCode;
		};
	
		window.onkeyup = function(evt) {
		graphControl.keyCode = evt.keyCode;
		};

		stage.getDOM().addEventListener("click", function() {
		if (that.keyCode == 16)
		{
		var pos = stage.getMousePosition();
		var v = new Vertex(pos.x, pos.y, "10");
		that.vertices.push(v);
		that.vertices_CollectionChanged_Insert(v, 10);
		that._canvasChildren[that._canvasChildren.length - 2].setContainer(shapesLayer);
		that._canvasChildren[that._canvasChildren.length - 1].setContainer(shapesLayer);
		shapesLayer.draw();
		}
		});
		//*/

		this.setContainer(shapesLayer, labelsLayer, toolboxLayer);
		shapesLayer.draw();
	}
}
