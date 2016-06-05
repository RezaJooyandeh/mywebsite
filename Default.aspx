<%@ Page Language="C#" MasterPageFile="~/SiteNew.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
	<meta name="description" content="This is Reza Jooyandeh's personal homepage" />
	<link href="http://jooyandeh.com/Resume.aspx" rel="next" />
	<title>Reza Jooyandeh</title>

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

	<script src="http://d3js.org/d3.v3.min.js"></script>
	<script src="http://d3js.org/topojson.v1.min.js"></script>
	<script src="http://d3js.org/d3.geo.projection.v0.min.js"></script>
	<script src="http://d3js.org/d3.geo.polyhedron.v0.min.js"></script>

	<script src="/Scripts/WorldMap.js"></script>
	<script src="/Combinatorics/Data/Scripts/SampleGraphs.js"></script>

	<style>
		.persianText {
			font-family: 'Droid Sans', 'Droid Arabic Naskh', Tahoma, sans-serif;
		}

		.demo {
			max-width: 600px;
			padding: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" runat="Server">
	<div class="row">
		<div class="col-12">
			<div class="MyPanel SpecialPanel4" style="margin-top: 10px;">
				<div style="font-size: 2em; ">
					Reza Jooyandeh
					<div class="search-box" style="font-weight: normal; margin-top: 7px;">
						<input type="text" id="query" size="26" maxlength="255" onkeydown="if (event.keyCode === 13) { document.getElementById('btnSearch').click(); return false; }" />
						<input type="button" id="btnSearch" value="Search" onclick="SearchEngine.search()" />
					</div>
				</div>
				<div>
					<img style="float: right; margin-left: 10px;" id="imgMe" src="Images/Me-HomePage.jpg" alt="Reza Jooyandeh's Photo" />

					<p>
						My name is <b>Reza Jooyandeh</b> officially (Mohammadreza Jooyandeh). It is a <a href="http://en.wikipedia.org/wiki/Persian_language">Persian</a> name natively written as <span class="persianText">رضا جوینده</span> which means <i>satisfaction</i> (Reza) and <i>searcher</i> (Jooyandeh). It's roughly pronounced as <span style="font-family: Arial; font-weight: bold;">[rezäː&nbsp;'ʤuːjændeʰ]</span> in <a href="http://en.wikipedia.org/wiki/International_Phonetic_Alphabet">IPA ASCII transcription</a>.
					</p>

					<p>
						I am a Computer Scientist by mind and a Mathematician by heart.
						I did two Bachelor degrees in Computer Science and Mathematics, followed by a Master in Computer Science at Amirkabir University of Technology.
						Then I did my PhD in Computational Graph Theory (Computer Science) at Australian National University.
						As a PhD student I was working on isomprohism testing of plane graphs and <a href="/Combinatorics/GraphGeneration.aspx">isomorph-free exhuastive generation of graphs</a>
						under supervision of <a href="http://cs.anu.edu.au/~bdm/">Prof. Brendan McKay</a>.
					</p>
					<p>More about me:
						<ul>
							<li>My detailed <a href="Resume.aspx">Résumé</a>.</li>
							<li>My <span style="font-weight: bold;">passion</span> is to bridge research and high-tech to industry work. A lot of amazing studies and researches are being done every day that never get to people's hand. My objective is to improve people's quality of life by bringing high-tech research into the software industry.</li>
							<li>My other <span style="font-weight: bold;">passion</span> is to teach and mentor. <span style="font-style: italic;">An aha moment makes my day.</span></li>
						</ul>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="MyPanel NormalPanel">
				<div>My <a href="http://en.wikipedia.org/wiki/Erdős_number">Erdős number</a> is 2</div>
				<div>
					<p>
						<a href="http://www.jooyandeh.com">Reza Jooyandeh</a> ► <a href="http://cs.anu.edu.au/~bdm/">Brendan McKay</a> ► <a href="http://en.wikipedia.org/wiki/Paul_Erd%C5%91s">Paul Erdős</a>.

						<div id="erdus-graph"></div>
						<script>
							var erdusGraph = {
								vertices: [[30, 150], [130, 230], [130, 105], [230, 150], [130, 30], [230, 230], [430, 150], [330, 230]],
								edges: [[0, 1], [0, 2], [0, 3], [0, 4], [1, 5], [2, 3], [3, 4], [3, 6], [5, 7], [6, 7]],
								edgeWeights: [1, 1, 3, 1, 1, 1, 1, 3, 1, 1],
								labels: ["RJ", "DK", "SMH", "BM", "GB", "SA", "PE", "PC"],
								hoverLabels: ["Reza Jooyandeh", "Dariush Kiani", "Seyed Mehdi Hashemi", "Brendan McKay", "Gunnar Brinkmann", "Saeed Akbari", "Paul Erdős", "Peter Cameron"],
								images: [
									"Images/Me-HomePage.jpg",
									"Images/Erdos/DariushKiani.jpg",
									"Images/Erdos/SMehdiHashemi.jpg",
									"Images/Erdos/BrendanMcKay.jpg",
									"Images/Erdos/GunnarBrinkmann.jpg",
									"Images/Erdos/SaeedAkbari.jpg",
									"Images/Erdos/PaulErdos.jpg",
									"Images/Erdos/PeterCameron.jpg"
								]
							};
							var erdusGraphSettings = {
								edge_width: 1.5,
								vertex_stroke: 1,
								vertex_radius: 29,
								textColor: "yellow",
								vertexStroke: "#BECFE9",
								edgeFill: "#BECFE9"
							};

							DrawGraph("erdus-graph", erdusGraph, erdusGraphSettings, "460", "260");
						</script>
					</p>
				</div>
			</div>

			<div class="MyPanel SpecialPanel6">
				<div>Where I am coming from?</div>
				<div>
					<p>
						I was born in Iran, but having lived in <span class="Asia">Asia</span>, <span class="oceania">Oceania</span>, <span class="europe">Europe</span> and <span class="north-america">North America</span>, I consider myself a citizen of the world; although I need to live in Africa and South America too truly be a citizen of the world.
					</p>

					<div id="map-container" style="margin-bottom: 10px;"></div>
					<script>
						createMap("#map-container");
						highlightContinents();
					</script>
				</div>
			</div>

			<div class="MyPanel SpecialPanel1">
				<div>At Microsoft</div>
				<div>
					<p>
						In 2014, I moved to Vancouver and started working at Microsoft in which I had the pleasure to work on several amazing projects:
						<ul>
							<li>
								<h4>Seeing AI (2016)</h4>
								Seeing AI helps people with visual impairment or blind to "see" the world around them. I have been the coach of the amazing team of interns who were working on this projects. The video below about Seeing AI was featured in the <a href="https://channel9.msdn.com/Events/Build/2016/KEY01">Keynote</a> of <span style="color: rgb(34, 189, 239)">//build/ 2016 conference</span> and was presented by <b>Satya Nadella</b>, CEO of Microsoft.

								<div class="demo">
									<div class="embed-responsive embed-responsive-16by9">
										<iframe allowfullscreen="allowfullscreen" src="https://www.youtube.com/embed/R2mC-NUAmMk"></iframe>
									</div>
								</div>
							</li>
							<li>
								<h4>Learning Tools for OneNote (2015-2016) <img src="Images/Grand-Prize.png" alt="Grand Prize" /></h4>
								This project started as a hackathon project in the Vancouver office and after expanding cross border and collaboration with Natural Language Processing team of Microsoft Research, Accessibility and several other amazing teams in Microsoft, ended up winning the grand prize of the worldwide Microsoft <span style="color: rgb(229, 14, 32)">//oneweek 2015</span> hackathon. Learning Tools for OneNote help everyone improve their reading and writing skills, including gifted learners, students with learning differences or a combination of any of the broad range of unique student abilities.

								<div class="demo">
									<div class="embed-responsive embed-responsive-16by9">
										<iframe allowfullscreen="allowfullscreen" src="https://www.youtube.com/embed/3Ztr44aKmQ8"></iframe>
									</div>
								</div>
							</li>
							<li>
								<h4>Sticky Notes (Since 2015)</h4>
								Currently, I am working on the Sticky Notes. We are building a smart and ubiquitous note-taking app to be right under your fingertips whenever you wanted to jot something down while being as comfortable as pen and paper.

								<div class="demo">
									<div class="embed-responsive embed-responsive-16by9">
										<img class="img-responsive" src="Images/StickyNotes.png" alt="Sticky Notes" />
									</div>
								</div>
							</li>
							<li>
								<h4>OneNote (2015) <img src="Images/OneNote.png" style="height: 25px;" alt="Microsoft OneNote"></h4>
								Microsoft OneNote is a comprehensive, cross-platform, collaborative note taking app with the support of stylus and deep integrations with Office suite. I used to work in the Storage, Sync and Collaboration team of OneNote.
								Also as a part of an internal hackathon project I worked on detecting shapes in OneNote which was later picked up by one of our team and is now <a href="https://blogs.office.com/2015/10/20/onenote-partners-with-fiftythree-to-support-pencil-and-paper-plus-shape-recognition-coming-soon/">officially released</a>.
							</li>
						</ul>
					</p>
				</div>
			</div>

			<div class="MyPanel SpecialPanel6">
				<div>Before Microsoft</div>
				<div>
					<p>
						Back in 2005-2008 I was working in a startup, Sourena Software Group which I was a co-founder of and I got to work on some amazing projects including a smart stock trader (FidoFa) and a word processor for some Braille embossers to be used by the division for the National Organization for Blind of the Ministry of Education of Iran for printing books in Braille to be used in schools nationwide. Speaking of Braille, here is how my name looks like in Braille:
						<div style="margin: 10px 0 0 0;">
							<table style="margin: 0 auto; padding: 0; border-collapse: collapse; border-spacing: 0;">
								<tr>
									<td>
										<div id="brailleFirstName"></div>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 10px;">
										<div id="brailleLastName"></div>
									</td>
								</tr>
							</table>
						</div>
					</p>
				</div>
			</div>

			<div class="MyPanel SpecialPanel5">
				<div>Friends &amp; Relevant Links</div>
				<div>
					<ul>
						<li>
							My wife, <a href="http://www.rajabiyazdi.com">Fateme Rajabiyazdi</a> is a PhD candidate at University of Calgary. Her research is focused on patient-physician communication, personal information, and self-monitoring.
						</li>
						<li>
							<a href="http://cs.anu.edu.au/~bdm/">Prof. Brendan McKay</a> was my PhD supervisor. He is one of the co-authors of nauty-traces, the fastest isomorphism testing and automorphism computation known algorithm. He is also working extensively of generation of several families of graphs and has some data sets of them on his website.
						</li>
						<li>
							My very good friend <a href="http://caagt.ugent.be/jgoedgeb/">Jan Goedgebeur</a> who is a Postdoctoral Researcher at University of Ghent working on generation of combinatorial structures.
						</li>
					</ul>
					<hr/>
					<ul>
						<li><a href="Combinatorics/GraphLab/">Graph Lab</a></li>
						<li><a href="Combinatorics/GraphGeneration.aspx">Graph Generation</a>, my research field.</li>
						<li><a href="http://cs.anu.edu.au/~bdm/data/">Brendan McKay's Combinatorial Data</a></li>
						<li><a href="Combinatorics/GraphLibrary.aspx">Gemini Graph Library</a>, a small C# library I wrote for graphs.</li>
						<li><a href="ComputationalGeometry/RandomSimplePolygonGenerator.aspx">Gemini Random PolygonGenerator</a>, an online random simple polygon generator.</li>
						<li><a href="http://hog.grinvin.org/">The House of Graph</a>, database of interesting graphs.</li>
					</ul>
				</div>
			</div>
			<!--<p>
				I have been working on a few Graph related projects:
			</p>-->

			<div class="MyPanel SpecialPanel4">
				<div>Find Me Through</div>
				<div>
					<p>
						You can find me on <a href="https://github.com/Reza1024">GitHub</a>, <a href="http://au.linkedin.com/in/jooyandeh">LinkedIn</a>, <a href="https://scholar.google.com.au/citations?user=FYCUcLkAAAAJ">Google Scholar</a>, <a href="https://twitter.com/rjooyandeh">Twitter</a>, <a href="https://www.facebook.com/mohammadreza.jooyandeh">Facebook</a>.
						<br />
						I wonder if you find what you are looking for here, so feel free to contact me at <span id="noscript-email">JavaScript must be enabled to display this email address.</span>.
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="MyPanel SpecialPanel2">
			<div style="display: none;"></div>
			<div>
				<div style="text-align: center; padding-top: 5px; padding-bottom: 5px;">
					© 2016 By Mohammadreza Jooyandeh - Last Update: 4 June 2016
				</div>
			</div>
		</div>
	</div>

	<script>
		var page = new Page();

		page.onReady.push(function () {
			EmailObfuscator.writeEmailTo("noscript-email");
			//setMyImageSize();

			Braille.writeToElement(Braille.Symbols.Capital, 45, "brailleFirstName");
			Braille.writeToElement("reza", 45, "brailleFirstName");
			Braille.writeToElement(Braille.Symbols.Capital, 45, "brailleLastName");
			Braille.writeToElement("jooyandeh", 45, "brailleLastName");
		});
	</script>
</asp:Content>

