<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GraphGeneration.aspx.cs" Inherits="Combinatorics_GraphGeneration" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="title" runat="Server">Graph Generation</asp:Content>
<asp:Content ID="SubtitleContent" ContentPlaceHolderID="subtitle" runat="server">Graph Generation</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" runat="Server">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel6">
				<div>My Field of Study</div>
				<div>
					I am currently working on graph algorithms. Technically, I am working on <b>isomorph-free exhaustive generation of graphs</b>. It seems very complicated but I can explain it easily so it is not!
					If you want to undrestand what it is, that is enough to read this <span style="color: Green"><b><i>non-technical</i></b></span> page!
				</div>
			</div>

			<div class="MyPanel SpecialPanel1">
				<div>What does "graph" mean?</div>
				<div>
					<p>
						A <b>graph</b> is a mathematical model for presenting a set of objects and relations between them.
						The objects and relations between them are usually visualised with some points and links (lines or arcs) between them.
						The points and the links are called <b>vertices</b> and <b>edges</b> in the language of mathematics.
						For example <span style="background-color: #3B5998; color: White; font-weight: bold">Facebook</span> can be considered as a graph in which people are the vertices and there is an edge between two people if they are friend.
						The following image can represents a graph of 5 friends which has 5 vertices and 10 edges (each two persons are friend with each other).
					</p>
					<img src="Images/K5.png" style="margin: 0 auto; display: block;" alt="A complete graph with 5 vertices." />
					<p>
						There are many families of graphs like <b>regular graphs</b> (graphs in which each vertex is related to the same number of vertices),
						<b>planar graphs</b> (graphs which can be drawn on a plane without edge crossing), <b>bipartite graphs</b> (graphs whose nodes can be divided
						in two parts and there is no edge between any two verteices of each part and etc. Undrestanding of each family of graphs
						has its own theoretical and practical purposes.
					</p>
				</div>
			</div>

			<div class="MyPanel NormalPanel">
				<div>Graph Generation</div>
				<div>
					<p>
						Graph generation is one of the branches of combinatorics which is interesting not only for combinatorists, but also other specialists
						because of its wide applications in other fields like
						<span style="color: Green">Network Design</span>,
						<span style="color: Green">Chemistry</span>,
						<span style="color: Green">Nano-Technology</span> and
						<span style="color: Green">Numerical Analysis</span>. The first work on this field was done by de Veris in 1891 who was a chemist.
					</p>
					<p>
						For a family of graphs like <b><i>F</i></b> we say that it can be <b>recursively generated</b> from a set of <b>initial graphs</b> and
						a collection of operations each of which convert some members of <b><i>F</i></b> to some other members of it if:
					</p>
					<ol>
						<li>Any of the initial graphs are in the family.</li>
						<li>Any graph in the family can be constructed from an initial graph with some applications of the operations.</li>
					</ol>
				</div>
			</div>

			<div class="MyPanel NormalPanel">
				<div>Graph Isomorphism</div>
				<div>
					Two graphs are called <b>isomorphic</b> if they can represent each others. Let's see what does it mean with an example. Consider these three cases:
					<ol>
						<li>Tom, Jack and Michelle are <b>friends</b> while Boris is just <b>friend</b> with Tom.</li>
						<li>Boris, Tom and Jack have <b>seen</b> Paris. Boris and Jack also have <b>visited</b> Rome.</li>
						<li>There is a <b>direct flight</b> between any two of Sydney, Tokyo and Beijing but the only <b>direct flights</b> to Canberra is from Sydney.</li>
					</ol>
					Let's make a graph for each case.
					<ol>
						<li>Tom, Jack, Michelle and Boris are <b>objects</b> while <b>friendship</b> is relation between them.</li>
						<li>Tom, Jack, Michelle and Boris are <b>objects</b> while two of them are related if both of them <b>have seen a city</b>.</li>
						<li>Sydney, Tokyo, Beijing and Canberra are <b>objects</b> while two of them are related if <b>there is a direct flight</b> between them.</li>
					</ol>
					The visualisation of the these graphs can be:
					
					<div class="wide" style="margin: 10px;">
						<div class="table-if-not-xs wide" style="margin: 0 auto; text-align: center;">
							<div>
								<img src="Images/G1.png" alt="Graph 1" />
								<br />
								<b>Graph 1</b>
							</div>
							<div>
								<img src="Images/G2.png" alt="Graph 2" />
								<br />
								<b>Graph 2</b>
							</div>
							<div>
								<img src="Images/G3.png" alt="Graph 3" />
								<br />
								<b>Graph 3</b>
							</div>
						</div>
					</div>
					Now we see that the graphs of all three cases is almost the same. The only difference between them is that the name of vertices are different.
					These kind of graphs which can be converted to each other by relabeling vertices are called <b>isomorph graphs</b>.
				</div>
			</div>

			<div class="MyPanel SpecialPanel6">
				<div>So Again! What is my Field of Study?</div>
				<div>
					<p>
						As I said, I am working on <b>isomorph-free exhaustive generation of graphs</b>.
						So far I have explained what does graph isomorphism and graph generation means. <b>Isomorph-free exhaustive generation</b> of a family graphs means generating that family of graphs in a way that
						none of the two generated graphs are isomorphic to each other. The importance of isomorph-free generation is that as a model there is no difference
						between two isomorph graphs so having isomorph graphs is redundant and also generally a graph, specially the big ones, can have exponentially so many isomorph versions (even with a fixed set of possible labels).
						So practically having so many redundant data can make the generation algorithm useless.
					</p>
					<p>
						Moreover, I should note that the term <b>exhaustive</b> means that the method generates whole the family because there are many researches in which some graphs
						in a family are generated instead of the whole family.
					</p>
				</div>
				<div></div>
				<div>
					Also:
					<ul>
						<li>I have a set of <a href="Data/Default.aspx">some families of graphs</a> which are generated using computer.</li>
						<li>I am working on a online lab for graphs called <a href="GraphLab/Default.aspx">Graph Lab</a>.</li>
						<li>I have written a C# library for graphs which can be found <a href="GraphLibrary.aspx">here</a>.</li>
						<li><a href="ANU/CECSPosterDay.aspx">My poster</a> for <a href="ANU/CECSPosterDay.aspx">CECS Poster Day exhibition</a> of 2010 <a href="ANU/CECSPosterDay.aspx">
							<span style="color: Red">here</span></a>.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

