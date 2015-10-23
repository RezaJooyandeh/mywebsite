<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Combinatorics_GraphLab_Default" Title ="Reza Jooyandeh - Graph Lab" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Graph Lab - Reza Jooyandeh</title>
	<link href="/Styles/bootstrap.min.css" rel="stylesheet" />
	<link href="/Styles/override-bootstrap.css" rel="stylesheet" />
	<link href="/Styles/Main.css" rel="stylesheet"/>
	<%--<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		try {
			var pageTracker = _gat._getTracker("UA-1032520-2");
			pageTracker._trackPageview();
		}
		catch (err) { }
	</script>
	<script type="text/javascript>"
		function search() {
			var txtQuery = document.getElementById("query");
			window.location = "http://www.google.com/search?sitesearch=jooyandeh.com&q=" + txtQuery.value;
		}
	</script>--%>
	<script type="text/javascript" src="Scripts/d3.js"></script>
	<script type="text/javascript" src="Scripts/BorislavMatrix.js"></script>
	<script type="text/javascript" src="Scripts/kinetic-v4.0.1.js"></script>
	<script type="text/javascript" src="Scripts/Gemini.Combinatorics.PlaneGraph.js"></script>
	<script type="text/javascript" src="Scripts/Gemini.Combinatorics.PlaneGraphEmbbeder.js"></script>
	<script type="text/javascript" src="Scripts/Gemini.Drawing.js"></script>
	<script type="text/javascript" src="Scripts/Gemini.Drawing.GraphControl2.js"></script>
	<script type="text/javascript" src="Scripts/Gemini.Combinatorics.PlaneGraphToSVG.js"></script>
	<script type="text/javascript">
		var graphControl;
		var width;
		var height;

		function loadControl() {
			var canvasId = "container";
			width = window.innerWidth - 25;
			height = window.innerHeight - 213;
			if (width > height)
				width = height;
			else
				height = width;

			var size = new Gemini.Drawing.Size(width, height);
			graphControl = new Gemini.Drawing.GraphControl(canvasId, size);
			//var canvas = document.getElementById(canvasId);
			//canvas.style.width = width + "px";
			//canvas.style.height = height + "px";

			//var padding = new Gemini.Drawing.Padding(15, 40, 25, 20);

			//graphControl.load(canvasId, size, padding);

			document.getElementById("tdContent").style.height = height + "px";
		}

		function readCode() {
			var code = document.getElementById('graph_code').value;
			if (code.length == 0) {
				//code = "4 2 3 4 0 1 4 3 0 1 2 4 0 1 3 2 0";
				//code = "7 2 3 4 0 1 4 5 6 7 3 0 1 2 7 4 0 1 3 7 5 2 0 2 4 7 6 0 2 5 7 0 2 6 5 4 3 0";
				//code = "17 2 3 0 1 4 3 5 6 7 0 1 8 2 9 10 0 2 10 11 0 2 7 12 0 2 13 14 0 2 15 5 8 0 3 7 0 3 11 0 3 4 0 4 9 0 5 14 13 0 6 12 16 0 6 17 12 15 0 7 14 0 13 17 0 14 16 0";
				//code = "20 2 3 4 0 1 4 5 6 7 8 9 10 11 12 3 0 1 2 12 7 13 14 15 4 0 1 3 15 14 16 13 7 5 2 0 2 4 7 17 6 0 2 5 17 7 0 2 6 17 5 4 13 3 12 18 8 0 2 7 18 19 12 9 0 2 8 12 10 0 2 9 12 20 11 0 2 10 20 12 0 2 11 20 10 9 8 19 18 7 3 0 3 7 4 16 14 0 3 13 16 4 15 0 3 14 4 0 4 14 13 0 5 7 6 0 7 12 19 8 0 8 18 12 0 10 12 11 0";
				//code = "42 2 3 4 0 1 5 6 7 8 9 0 1 9 10 0 1 10 5 0 2 4 11 0 2 11 12 0 2 13 14 0 2 15 16 0 2 17 18 3 0 3 18 19 12 11 4 0 5 10 6 0 6 10 20 13 0 7 12 21 0 7 22 15 0 8 14 23 24 0 8 25 17 0 9 16 26 0 9 27 28 10 0 10 29 30 0 12 30 31 0 13 31 22 0 14 21 32 0 15 32 33 0 15 34 25 0 16 24 35 0 17 35 27 0 18 26 36 0 18 37 29 0 19 28 38 0 19 39 20 0 20 40 21 0 22 40 23 0 23 39 34 0 24 33 41 42 0 25 42 26 0 27 42 37 0 28 36 41 0 29 41 39 0 30 38 33 40 0 31 39 32 0 34 38 37 0 34 36 35 0";
				//code = "57 2 3 4 5 0 1 6 7 0 1 8 9 0 1 10 11 0 1 12 13 0 2 13 14 0 2 15 8 0 3 7 16 0 3 17 10 0 4 9 18 0 4 19 12 0 5 11 20 0 5 21 6 0 6 22 15 0 7 14 23 0 8 24 17 0 9 16 25 0 10 26 19 0 11 18 27 0 12 28 21 0 13 20 29 0 14 30 31 0 15 31 32 0 16 33 34 0 17 34 35 0 18 36 37 0 19 37 38 0 20 39 40 0 21 40 41 0 22 41 42 0 22 43 23 0 23 44 33 0 24 32 45 0 24 46 25 0 25 47 36 0 26 35 48 0 26 49 27 0 27 50 39 0 28 38 51 0 28 52 29 0 29 53 30 0 30 54 43 0 31 42 44 0 32 43 55 0 33 55 46 0 34 45 47 0 35 46 56 0 36 56 49 0 37 48 50 0 38 49 57 0 39 57 52 0 40 51 53 0 41 52 54 0 42 53 57 55 0 44 54 56 45 0 47 55 57 48 0 50 56 54 51 0";
				code = "40 2 3 4 0 1 5 6 7 0 1 8 9 0 1 10 11 0 2 11 12 0 2 13 14 0 2 15 8 0 3 7 16 0 3 17 10 0 4 9 18 0 4 19 5 0 5 20 13 0 6 12 21 0 6 22 15 0 7 14 23 24 0 8 24 25 17 0 9 16 26 0 10 26 19 0 11 18 27 20 0 12 19 28 29 0 13 29 22 0 14 21 30 0 15 30 31 0 15 32 16 0 16 33 34 0 17 34 18 0 19 34 35 28 0 20 27 36 0 20 36 37 21 0 22 37 23 0 23 38 32 0 24 31 33 0 25 32 39 0 25 40 27 26 0 27 40 36 0 28 35 39 29 0 29 38 30 0 31 37 39 0 33 38 36 40 0 34 39 35 0";
				document.getElementById('graph_code').value = code;
			}

			graphControl.EmbeddingSettings.isOuterFaceBiggest = document.getElementById("rdbBigFaceOut").checked;
			graphControl.EmbeddingSettings.putOuterFaceOnCircle = document.getElementById("rdbOutFaceOnCircle").checked;
			var graph = Gemini.Combinatorics.PlaneGraph.FromIntCode(code);
			graphControl.LoadFromPlaneGraph(graph);

			document.getElementById("btnMakeSVG").style.visibility = 'visible';
		}

		function clearControl() {
			graphControl.Clear();
			document.getElementById("btnMakeSVG").style.visibility = 'hidden';
		}

		function makeSVG() {
			var svgContent = document.getElementById("container").innerHTML.replace(new RegExp("cursor=\"move\" ", "g"), "");

			window.URL = window.webkitURL || window.URL;
			var file = new Blob([svgContent], { type: 'image/svg+xml' });
			var a = document.createElement('a');
			a.href = window.URL.createObjectURL(file);
			a.download = 'filename.svg';
			a.textContent = "SVG";
			var svgContainer = document.getElementById("svgLinkContainer");
			svgContainer.innerHTML = "";
			svgContainer.appendChild(a);
		}

	</script>
	<style type="text/css">
		h1
		{
			font-size: 140%;
			font-weight: normal;
			color: #036;
			border-bottom: 1px solid #ccc;
		}
		canvas
		{
			/*border: 2px solid #000;*/
			float: left;
			margin-right: 20px;
			margin-bottom: 20px;
		}
		pre
		{
			float: left;
			display: block;
			background: rgb(238,238,238);
			border: 1px dashed #666;
			padding: 15px 20px;
			margin: 0 0 10px 0;
		}
	</style>
</head>
<body onload="loadControl()" style="text-align: left">
	<form id="form2" runat="server">
	<table style="width: 100%">
		<tr>
			<td style="width: 100%">
				<div class="MyPanel SpecialPanel6" style="height: 170px">
					<div>
						<div style="float: left;">Settings</div>
						<div style="float: right; font-weight: normal; font-size: small;">Powered by <a href="http://www.jooyandeh.com">Reza Jooyandeh</a></div>
						<div style="clear: both;"></div>
					</div>
					<div>
						<table>
							<tr>
								<td style="white-space: nowrap;">
									Graph Code: <a onclick="document.getElementById('tdFormat').style.color = 'red'" href="#format">?</a>
								</td>
								<td style="width: 100%; padding-right: 5px">
									<input type="text" id="graph_code" style="width: 100%" value="7 2 3 0 1 4 5 0 1 6 4 0 2 3 7 0 2 7 6 0 3 5 0 4 5 0" />
									<%--"57 2 3 4 5 0 1 6 7 0 1 8 9 0 1 10 11 0 1 12 13 0 2 13 14 0 2 15 8 0 3 7 16 0 3 17 10 0 4 9 18 0 4 19 12 0 5 11 20 0 5 21 6 0 6 22 15 0 7 14 23 0 8 24 17 0 9 16 25 0 10 26 19 0 11 18 27 0 12 28 21 0 13 20 29 0 14 30 31 0 15 31 32 0 16 33 34 0 17 34 35 0 18 36 37 0 19 37 38 0 20 39 40 0 21 40 41 0 22 41 42 0 22 43 23 0 23 44 33 0 24 32 45 0 24 46 25 0 25 47 36 0 26 35 48 0 26 49 27 0 27 50 39 0 28 38 51 0 28 52 29 0 29 53 30 0 30 54 43 0 31 42 44 0 32 43 55 0 33 55 46 0 34 45 47 0 35 46 56 0 36 56 49 0 37 48 50 0 38 49 57 0 39 57 52 0 40 51 53 0 41 52 54 0 42 53 57 55 0 44 54 56 45 0 47 55 57 48 0 50 56 54 51 0"--%>
								</td>
								<td>
									<input type="button" id="btnLoad" value="Load" onclick="readCode()" style="width: 100px" />
								</td>
								<td>
									<input type="button" id="btnClear" value="Clear" onclick="clearControl()" style="width: 100px" />
								</td>
							</tr>
							<tr>
								<td style="padding-left: 100px">
								</td>
								<td>
									<b>Outer Face:</b> <input type="radio" name="faceOut" value="BigFaceOut" id="rdbBigFaceOut" checked="checked" />Biggest face
									<input type="radio" name="faceOut" value="SmallFaceOut" />Smallest face
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>Outer Face on:</b> <input type="radio" name="faceOutOn" value="Circle" id="rdbOutFaceOnCircle" checked="checked" />Circle
									<input type="radio" name="faceOutOn" value="Square" />Square
								</td>
								<td>
									<input type="button" id="btnMakeSVG" value="Make SVG" style="width: 100px; visibility: hidden"
										onclick="makeSVG()" />
								</td>
								<td id="svgLinkContainer">
								</td>
							</tr>
							<tr>
								<td style="padding: 25px"></td>
								<td colspan="3" id="tdFormat"><a name="format"></a>Each graph is given as a sequence of numbers, starting with the number of vertices.
								Then for each vertex, a list of the neighbours is given in clockwise order, plus a zero to end the list. Vertices are numbered starting with 1.
								For example try this one and check what you get: <a onclick="document.getElementById('graph_code').value='7 2 3 0 1 4 5 0 1 6 4 0 2 3 7 0 2 7 6 0 3 5 0 4 5 0'">7 2 3 0 1 4 5 0 1 6 4 0 2 3 7 0 2 7 6 0 3 5 0 4 5 0</a>.
								The initial 7 means there are 7 vertices. Then the first vertex is adjacent to 2 and 3; 2 is adjacent to 1, 4 and 5; 3 is adjacent to 1, 6 and 4; and so on. Note the clockwise order of neighbours too.</td>
							</tr>
						</table>
					</div>
				</div>
			</td>
			<td style="vertical-align: top;">
				<div class="MyPanel SpecialPanel2" style="margin-left: 10px; width: 300px; height: 170px;">
					<div>Liked it?!</div>
					<div style="padding: 10px" id="divSocialNetwork" runat="server">
					</div>
				</div>
			</td>
		</tr>
	</table>
	<table style="width: 100%">
		<tr>
			<td>
				<div class="MyPanel SpecialPanel1">
					<div>Drawing</div>
					<div>
						<div id="container" />
					</div>
				</div>
			</td>
			<td style="width: 100%; vertical-align: top; text-align: right; padding-left: 10px;">
				<div class="MyPanel NormalPanel">
					<div>Information Panel (Comming Soon)</div>
					<div id="tdContent" style="text-align: right; vertical-align: bottom">
						<p runat="server" id="pscript">
						</p>
						<table class="wide" cellpadding="0" cellspacing="0">
							<tr>
								<td style="width: 100%">
								</td>
								<td runat="server" id="tdStat" align="center">
								</td>
							</tr>
						</table>
						<script language="javascript" type="text/javascript">
							if (window.innerWidth > 1550) {
								var tblMainContent = document.getElementById("tblMainContent");
								tblMainContent.style.width = 1500 + "px";
							}
						</script>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
