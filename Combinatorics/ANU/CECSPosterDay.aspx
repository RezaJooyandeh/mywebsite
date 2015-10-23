<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CECSPosterDay.aspx.cs" Inherits="Combinatorics_ANU_CECSPosterDay" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" Runat="Server">
	<style>
		@media (min-width:768px) {
			.graph-lab {
				display: inline-table;
			}

			.graph-lab > div {
				display: table-cell;
			}
		}
	</style>
</asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="title" Runat="Server">CECS Poster Day 2010</asp:Content>
<asp:Content ID="SubTitleContent" ContentPlaceHolderID="subtitle" Runat="Server">CECS Poster Day 2010</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" Runat="Server">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel1">
				<div>Poster Day</div>
				<div>
					<p>
						Poster Day of <a href="http://cecs.anu.edu.au">ANU College of Engineering & Computer Science</a> is an annual exhibition in which
						all PhD and MPhil students make posters about their works and present them in a hall in university.
					</p>
				</div>
			</div>

			<div class="MyPanel NormalPanel">
				<div>2010 - To be Designed or to be Generated - That's the Question!</div>
				<div class="table-if-not-xs">
					<div style="padding-right: 10px; vertical-align: top">
						<div><img src="Images/CECSPosterDay.2010Small.png" alt="2010" width="291" height="205" /></div>
						<div style="padding-top: 5px">
							<img src="http://maps.google.com/maps/api/staticmap?center=-35.29365,149.1301&amp;zoom=12&amp;size=291x210&amp;sensor=false&amp;markers=color:red|size:small|-35.299,149.148&amp;markers=color:red|size:small|Capital%20Hill%20ACT,%20Australia&amp;markers=color:red|size:small|-35.282017,149.128577&amp;path=color:0x0000ff|weight:5|-35.282017,149.128577|-35.299,149.148|Capital%20Hill%20ACT,%20Australia|-35.282017,149.128577" alt="Starting Step of Generation" width="291" />
						</div>
					</div>
					<div style="vertical-align: top">
						<div>
							The main idea behind the visualisation of my poster is based on the history of <a href="http://en.wikipedia.org/wiki/Canberra">Canberra</a> which is one of the most important
							<a href="http://en.wikipedia.org/wiki/New_town">planned cities</a> in the world. Canberra is designed by Chicago architects
							<a href="http://en.wikipedia.org/wiki/Walter_Burley_Griffin">Walter Burley Griffin</a> and <a href="http://en.wikipedia.org/wiki/Marion_Mahony_Griffin">Marion Mahony Griffin</a>.
						</div>
						<div>
							One of the main reasons which make me be interested in graph generation is that it provides different families of graphs. The benefit of having these families is that
							for different purposes we can search in the existing graphs and find what we are looking for.
							In my poster, I tried to put <b>"generating"</b> as a rival for <b>"designing"</b>. The term generating refers to graph and means graph generation while designing is considered as city designing.
							I tried to show that we may use graph generation for designing cities.
							Actually now, it is too soon that we can announce that graph generation can be used for designing cities because it is still a child, but I hope this idea is achieved in the future.
						</div>
						<div>
							The background image is the map of Canberra and the boxes surrounding the text are steps through which Canberra can be generated from a triangle.
							In current Canberra, this triangle is made of <a href="http://maps.google.com/maps/api/staticmap?center=-35.29365,149.1301&amp;zoom=12amp;size=291x210&amp;sensor=false&amp;markers=color:red|size:small|-35.299,149.148&amp;markers=color:red|size:small|Capital%20Hill%20ACT,%20Australia&amp;markers=color:red|size:small|-35.282017,149.128577&amp;path=color:0x0000ff|weight:5|-35.282017,149.128577|-35.299,149.148|Capital%20Hill%20ACT,%20Australia|-35.282017,149.128577">Commonwealth Ave., Kings Ave. and Parkes Way</a> while 
							Parliament House and London Circuit are two of the three vertices of it.
						</div>
						<div>
							Although this is my first year in this exhibition, but I tried to do my best! I've uploaded two version of my poster also for the ones who like to have a look here:
							<ul>
								<li><b>Small Version</b> <a id="PosterPNG" runat="server" href="Images/CECSPosterDay.2010.png">(Download)</a></li>
								<li><b>High Quality Version</b> <a id="PosterPDF" runat="server" href="CECSPosterDay.2010.pdf">(Download)</a></li>
							</ul>
						</div>
						<div>
							I'd like to thanks <a href="http://en.wikipedia.org/wiki/William_Shakespeare">William Shakespeare</a>
							because of his famous quotation:<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"To be, or not to be - That's the question"</b><br />
							in <a href="http://en.wikipedia.org/wiki/Hamlet">Hamlet</a> from which I got the idea of the title of my poster.
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</asp:Content>

