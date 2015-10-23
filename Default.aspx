<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js" charset="utf-8"></script>
</asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="title" runat="Server">Home Page</asp:Content>
<asp:Content ID="SubtitleContent" ContentPlaceHolderID="subtitle" runat="server"></asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" runat="Server">
	<div class="row">
		<div class="col-lg-3 col-md-5 hidden-sm hidden-xs">
			<div class="panelImageMe"></div>
		</div>
		<div class="col-sm-5 visible-sm visible-xs">
			<div class="panelImageMe"></div>
			<div class="MyPanel NormalPanel panelContactInfo" style="margin-top: 10px;"></div>
		</div>
		<div class="col-lg-6 col-md-7 col-sm-7">
			<div id="divWelcome" class="MyPanel SpecialPanel4 panelWelcome"></div>
			<div class="MyPanel SpecialPanel1 visible-md panelGraphRelated"></div>
		</div>
		<div class="col-lg-3 visible-lg">
			<div class="MyPanel SpecialPanel1 panelGraphRelated"></div>
			<div class="MyPanel NormalPanel panelContactInfo"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-8 col-md-7">
			<div class="MyPanel SpecialPanel5 panelSpotlight"></div>
			<div class="MyPanel NormalPanel panelBraille"></div>
		</div>
		<div class="col-lg-4 col-md-5">
			<div class="MyPanel NormalPanel panelContactInfo visible-md"></div>
			<div class="MyPanel SpecialPanel1 visible-xs visible-sm panelGraphRelated"></div>
			<div class="MyPanel SpecialPanel6 panelLinks"></div>
			<div class="MyPanel SpecialPanel4 panelLikedIt"></div>
		</div>
	</div>

	<div id="divPanelContents" style="display: none">
		<div class="panelImageMeContent">
			<img id="imgMe" src="Images/Me-Home.jpg" alt="Reza Jooyandeh's Photo" />
		</div>
		<div class="panelWelcomeContent">
			<div>Welcome to My Site</div>
			<div>
				<p>
					My name is Reza Jooyandeh (<a href="http://en.wikipedia.org/wiki/Persian_language">Persian</a>: <span style="font-family: Tahoma">رضا جوینده</span>) which is roughly pronounced as
						<span style="font-family: Arial; font-size: small">[rezäː&nbsp;'ʤuːjændeʰ]</span> in <a href="http://en.wikipedia.org/wiki/International_Phonetic_Alphabet">IPA ASCII transcription</a>,
							but my official name is Mohammadreza Jooyandeh (<a href="http://en.wikipedia.org/wiki/Persian_language">Persian</a>: <span style="font-family: Tahoma">محمدرضا جوینده</span>).	
				</p>
				<p>
					I am a Software Developer Engineer 2 at <a href="http://www.microsoft.com">Microsoft</a> <a href="http://www.onenote.com">OneNote</a>. I started working at Microsoft
						in 2014 after finishing my PhD on <a href="Combinatorics/GraphGeneration.aspx">isomorph-free exhaustive generation of graphs</a> and isomorph-rejection of plane graphs under supervision of <a href="http://cs.anu.edu.au/~bdm/">Prof. Brendan McKay</a> in the <a href="http://cs.anu.edu.au">Research School of Computer Science</a> at the <a href="http://www.anu.edu.au">Australian National University</a>.
				</p>
				<p>
					My <a href="http://en.wikipedia.org/wiki/Erdős_number">Erdős number</a> is 3
						(<a href="http://academic.research.microsoft.com/VisualExplorer#56701019&amp;1112639">want to know how?</a>),
						but I am about to make it 2!<br />
					<a href="http://www.jooyandeh.com">Reza Jooyandeh</a> ► <a href="http://www.twist.ugent.be/index.php?page=personeel&amp;ugentid=801001807792">Gunnar Brinkmann</a> ► <a href="http://cs.anu.edu.au/~bdm/">Brendan McKay</a> ► <a href="http://en.wikipedia.org/wiki/Paul_Erd%C5%91s">Paul Erdős</a>.
				</p>
			</div>
		</div>
		<div class="panelGraphRelatedContent">
			<div>Graph Related Work</div>
			<div>
				<p>
					As a PhD student, I was working on generating some families of planar and regular
						graphs <a href="Combinatorics/GraphGeneration.aspx">(more ...)</a>.
				</p>
				<p>A small library for graphs <a href="Combinatorics/GraphLibrary.aspx">(more ...)</a>.</p>
				<p>An online <a href="Combinatorics/GraphLab/">graph lab</a> in which one can find different properties of graphs.</p>
			</div>
		</div>
		<div class="panelContactInfoContent">
			<div>Contact Information</div>
			<div>
				<table class="normalTable">
					<tr>
						<td>Email:</td>
						<td>
							<span id="noscript-email">JavaScript must be enabled to display this email address.</span>
						</td>
					</tr>
					<tr>
						<td>Social:</td>
						<td>
							<a href="http://scholar.google.com.au/citations?user=FYCUcLkAAAAJ&amp;sortby=pubdate">
								<img src="Images/Social/GoogleScholar-Small.png" alt="Google Scholar" title="Google Scholar" style="border: 0" /></a>
							<a href="http://anu.academia.edu/MohammadrezaJooyandeh">
								<img src="Images/Social/Academia-Small.png" alt="Academia" title="Academia" style="border: 0" /></a>
							<a href="http://au.linkedin.com/in/jooyandeh">
								<img src="Images/Social/Linkedin-Small.png" alt="LinkedIn" title="LinkedIn" style="border: 0" /></a>
							<a href="https://www.facebook.com/mohammadreza.jooyandeh">
								<img src="Images/Social/Facebook-Small.png" alt="Facebook" title="Facebook" style="border: 0" /></a>
							<a href="http://www.jooyandeh.com">
								<img src="Images/Social/HomePage-Small.png" alt="Homepage" title="Homepage" style="border: 0" /></a>
							<a href="http://cs.anu.edu.au/user/4121">
								<img src="Images/Social/WorkPage-Small.png" alt="University Homepage" title="University Homepage" style="border: 0" /></a>
							<a href="http://academic.research.microsoft.com/Author/56701019/mohammadreza-jooyandeh">
								<img src="Images/Social/MicrosoftAcademic-Small.png" alt="University Homepage" title="Microsoft Academic" style="border: 0" /></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="panelSpotlightContent">
			<div>Spotlight</div>
			<div>
				<p>1. Our project <a href="http://news.microsoft.com/features/microsoft-hackathon-2015-winner-extends-onenote-to-improve-learning-outcomes-for-students/">OneNote for Learning</a> won the Grand Prize of <span style="color: red">//oneweek</span>, Microsoft-wide hackathon 2015.</p>
				<hr />
				<p>2. The initial version of <a href="Combinatorics/GraphLab/">Graph Lab</a> is added. At the moment it just draws plane graphs.</p>
				<p>3. I have added pages <a href="Combinatorics/Data/">combinatorial data</a>, <a href="Combinatorics/Data/PlanarHypohamiltonian.aspx">planar hypohamiltonian graphs</a> and <a href="Combinatorics/Data/K-Angulations.aspx">k-angulations</a>.</p>
				<p>
					4. I have added pages <a href="Combinatorics/GraphLibrary.aspx">graph library</a>
					and <a href="ComputationalGeometry/RandomSimplePolygonGenerator.aspx">random simple polygon generator</a>.
				</p>
			</div>
		</div>
		<div class="panelBrailleContent">
			<div>In Braille I am some thing like this!</div>
			<div>
				<table class="wide" style="text-align: center">
					<tr><td><div id="brailleFirstName"></div></td></tr>
					<tr><td><div id="brailleLastName"></div></td></tr>
				</table>
			</div>
		</div>
		<div class="panelLinksContent">
			<div>Links</div>
			<div>
				<div>
					<a href="http://fateme.rajabiyazdi.com">Fateme Rajabiyazdi</a> (My Wife)<br />
				</div>
				<hr />
				<div>
					<a href="Combinatorics/GraphLab/">Graph Lab</a><br />
					<a href="Combinatorics/GraphGeneration.aspx">Graph Generation</a> (My Research Field)<br />
					<a href="http://cs.anu.edu.au/~bdm/">Prof. Brendan McKay</a> (My Supervisor)<br />
					<a href="http://cs.anu.edu.au/~bdm/data/">Prof. McKay's Combinatorial Data</a><br />
					<a href="http://hog.grinvin.org/">The House of Graphs</a>
				</div>
				<hr />
				<div>
					<a href="Combinatorics/GraphLibrary.aspx">Gemini Graph Library</a><br />
					<a href="ComputationalGeometry/RandomSimplePolygonGenerator.aspx">Gemini Random PolygonGenerator</a>
				</div>
				<hr />
				<div>
					<a href="http://www.stellarium.org/">Stellarium (a free planetarium)</a><br />
				</div>
			</div>
		</div>
		<div class="panelLikedItContent">
			<div>Liked It?!</div>
			<div id="divSocialNetwork" runat="server"></div>
		</div>
	</div>

	<script>
		var page = new Page({
			panels: [ "ImageMe", "Welcome", "GraphRelated", "ContactInfo", "Spotlight", "Braille", "Links", "LikedIt" ]
		});

		function setMyImageSize() {
			var imgMeContainer = $("#imgMe").parent();
			$("#imgMe").width(imgMeContainer.width());

			if (page.isInMode('lg'))
				$("#divWelcome").outerHeight(imgMeContainer.outerHeight());
			else if (page.isInMode('sm')) {
				$("#divWelcome").height(imgMeContainer.parent().height());
			}
			else
				$("#divWelcome").outerHeight("");
		}

		page.onResizeReady.push(setMyImageSize);

		page.onReady.push(function () {
			EmailObfuscator.writeEmailTo("noscript-email");
			setMyImageSize();

			Braille.writeToElement(Braille.Symbols.Capital, 35, "brailleFirstName");
			Braille.writeToElement("reza", 35, "brailleFirstName");
			Braille.writeToElement(Braille.Symbols.Capital, 35, "brailleLastName");
			Braille.writeToElement("jooyandeh", 35, "brailleLastName");
		});
	</script>
</asp:Content>

