<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Resume.aspx.cs" Inherits="Resume" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="title" runat="Server">Resume</asp:Content>
<asp:Content ID="SubtitleContent" ContentPlaceHolderID="subtitle" runat="server">Resume</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" runat="Server">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel1">
				<div>Contact Information</div>
				<div style="padding-left: 15px; padding-right: 15px;">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
							<p>Email: <span id="noscript-email">JavaScript must be enabled to display this email address.</span></p>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
							<p>
								Social:
								<a href="http://au.linkedin.com/in/jooyandeh">
									<img src="Images/Social/Linkedin-Small.png" alt="Linked in" title="Linked in" style="border: 0" /></a>
								<a href="http://scholar.google.com.au/citations?user=FYCUcLkAAAAJ&amp;sortby=pubdate">
									<img src="Images/Social/GoogleScholar-Small.png" alt="Google Scholar" title="Google Scholar" style="border: 0" /></a>
								<a href="http://academic.research.microsoft.com/Author/56701019/mohammadreza-jooyandeh">
									<img src="Images/Social/MicrosoftAcademic-Small.png" alt="University Homepage" title="Microsoft Academic" style="border: 0" /></a>
								<a href="http://www.jooyandeh.com">
									<img src="Images/Social/HomePage-Small.png" alt="Homepage" title="Homepage" style="border: 0" /></a>
								<%--<a href="https://www.facebook.com/mohammadreza.jooyandeh">
									<img src="Images/Social/Facebook-Small.png" alt="Facebook" title="Facebook" style="border: 0" /></a>--%>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div id="Education" class="MyPanel NormalPanel">
				<div>Education</div>
				<div>
					<p>
						<b>Ph.D. In Computer Science</b> (2010-2014),
						<br />
						<a href="http://www.anu.edu.au">The Australian National University</a>, Australia
						<br />
						<b>Subject of Thesis:</b> Recursive Algorithms for <a href="Combinatorics/GraphGeneration.aspx">Generation</a> of Planar Graphs
						<br />Supervisor: <a href="http://cs.anu.edu.au/~bdm/">Prof. Brendan Mckay</a>
						<br />Co-supervisor: <a href="http://cs.anu.edu.au/~Weifa.Liang/">Prof. Weifa Liang</a>,
						<br />Advisor: <a href="http://www.mpi-inf.mpg.de/~pascal/">Dr. Pascal Schweitzer</a>
					</p>
					<p>
						<b>M.Sc. In Computer Science (Honours)</b> (2006-2009), GPA: 19.52 / 20
						<br />
						<span style="color: red">(1<sup>st</sup> ranked graduate)</span>
						<br />
						<a href="http://www.aut.ac.ir">Amirkabir University of Technology</a>, Iran
						<br />
						<b>Subject of Thesis:</b> Designing an Aspect-Oriented Persistence Layer Supporting Object-Oriented Querying
					</p>
					<p>
						<b>B.Sc. in Mathematics</b> (2002-2007), GPA: 16.41 / 20
						<br />
						<a href="http://www.aut.ac.ir">Amirkabir University of Technology</a>, Iran<br />
					</p>
					<p>
						<b>B.Sc. in Computer Science (Honours)</b> (2002-2006), GPA: 16.07 / 20
						<br />
						<a href="http://www.aut.ac.ir">Amirkabir University of Technology</a>, Iran
						<br />
						<b>Subject of Thesis:</b> Scheduling of School Calsses Using Genetic Algrithom
					</p>
					<p>
						<b>Diploma in Mathematics and Physics</b> (1998-2002)<br />
						<a href="http://www.nodet.org/">National Organization for Development of Exceptional Talents</a>
						<br />
						<a href="http://en.wikipedia.org/wiki/Shahid_Soltani_School">Shahid Soltani High School</a>, Iran
					</p>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div id="ProfessionalExperiences" class="MyPanel SpecialPanel6">
				<div>Work Experience</div>
				<div>
					<div>
						<p><b class="bigText"><a href="http://www.microsoft.com">Microsoft Corporation</a> (Since 2014)</b></p>
						<ul>
							<li><b>Microsoft Sticky Notes (Since 2015)</b>
								<br />
								Software Developer Engineer II
							</li>
							<li><b>Seeing AI (2016)</b>
								<br />
								Coach of the interns and code reviewer
							</li>
							<li><b>Learning Tools for OneNote (2015-2016)</b>
								<br />
								Software Developer Engineer II
							</li>
							<li><b><a href="http://www.onenoe.com" style="color: #7D1D73;">Microsoft OneNote  <img src="Images/OneNote.png" style="height: 25px;" alt="Microsoft OneNote Icon"/></a> (2015)</b>
								<br />
								Software Developer Engineer II
							</li>
							<li><b>Do More Experiences (2014-2015)</b>
								<br />
								Software Developer Engineer
							</li>
						</ul>
					</div>
					<div>
						<p><b class="bigText">Nebras Informatics (2008–2010)</b></p>
						<ul>
							<li>
								<b>Nebras Framework</b>
								<br />
								Project Manager, Architect and Senior Developer
							</li>
							<li>
								<b>Nebras Security Service</b>
								<br />
								Project Manager, Architect and Senior Developer
							</li>
							<li>
								<b>Nebras Persistence Service</b>
								<br />
								Senior Developer
							</li>
						</ul>
					</div>
					<div>
						<p><b class="bigText">Sourena Software Group (2005–2008)</b></p>
						<ul>
							<li>
								<b>FidoFa (An Smart Stock Trader)</b>
								<br />
								Architecht and Senior Developer
							</li>
							<li>
								<b>Persian Text to Speech</b>
								<br />
								Project Manager
							</li>
							<li>
								<b>Braille Word Processor</b>
								<br />
								Project Manager, Architect and Developer
							</li>
							<!--<li>
								<b>Sourena Mobile Services</b>
								<br />
								Project Manager, Architect and Developer
							</li>-->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div id="AwardsAndHonors" class="MyPanel SpecialPanel4">
				<div>Awards and Honors</div>
				<div>
					<p><b>Aug 2015</b>: <img src="Images/Grand-Prize.png" alt="Grand Prize" style="height: 25px; margin-right: 5px;" /><span style="color: Green">Grand Prize</span>, Microsoft <span style="color: red">//oneweek</span> Hackathon 2015, <a href="http://news.microsoft.com/features/microsoft-hackathon-2015-winner-extends-onenote-to-improve-learning-outcomes-for-students/">OneNote for Learning</a>, Microsoft Wide.</p>
					<p><b>May 2006:</b> <img src="Images/Medal-Small.png" alt="Medal" style="height: 25px; margin-right: 5px;" /><span style="color: Green">Silver Medal</span>, <i>30<sup>th</sup> Nationwide Mathematics Contest for University Students</i>, Iran.</p>
					<p><b>Jul 2005:</b> <img src="Images/Honorable-Mention-Small.png" alt="Honorable Mention" style="height: 25px; margin-right: 5px;" /><span style="color: Green">Honorable Mention</span>, <a href="http://www.imc-math.org.uk/index.php?year=2005"><i>12<sup>th</sup> International Mathematics Olympiad for University Students</i></a>, Bulgaria.</p>
					<p><b>Oct 2010:</b> <img src="Images/Xbox-Small.png" alt="Gaming" style="height: 25px; margin-right: 5px;" /><span style="color: Green">1<sup>st</sup> prize</span> in <i><a href="http://www.anu-cssa.com/gamecamp/">Microsoft - ANU ImagineCup Game Camp</a></i>, Australia.</p>
					<p><b>May 2005:</b> <img src="Images/Medal-Small.png" alt="Medal" style="height: 25px; margin-right: 5px;" /><span style="color: Green">Silver Medal</span>, <i>29<sup>th</sup> Nationwide Mathematics Contest for University Students</i>, Iran.</p>
					<p><b>Dec 2004:</b> <img src="Images/Honorable-Mention-Small.png" alt="Honorable Mention" style="height: 25px; margin-right: 5px;" /><span style="color: Green">Honorable Mentioned</span>, <i>29<sup>th</sup> ACM / International Collegiate Programming Contest</i>, Asian Region, Tehran Site.</p>
					<p><b>Jun 2007:</b> <span style="color: Green">1<sup>st</sup> rank</span> of <i>total grade among M.Sc. Students in <b>All Majors</b> of <a href="http://www.aut.ac.ir">Amirkabir University of Technology</a></i>, Iran.</p>
					<p><b>Dec 2012</b>: <img src="Images/Presentation.png" alt="Presentation" style="height: 25px; margin-right: 5px;" /><span style="color: Green">Best Student Presentation Award</span>, at the <a href="http://conferences.science.unsw.edu.au/36accmcc/">36<sup>th</sup> Australasian Conference on Combinatorial Math & Combinatorial Computing</a>, Australia.</p>
					<p><b>May 2006:</b> <span style="color: Green">4<sup>th</sup> rank</span>, <i>M.Sc. Nationwide Entrance Exam in Computer Science</i>, Iran.</p>
					<p><b>Jul 2003:</b> <span style="color: Green">7<sup>th</sup> team rank</span>, <i>Robocup Rescue Simulation League</i>, Italy.</p>

					<hr />
					<p><b>Dec 2010</b>: <span style="color: Green">Top-Three Shortlist</span> for the <i>Best Student Presentation</i> at the 34th Australasian Conference on Combinatorial Mathematics & Combinatorial Computing, Australia.</p>
					<p><b>Jun 2008:</b> <span style="color: Green">1<sup>st</sup> rank</span> of <i>total grade among M.Sc. Students in Department of Mathematics and Computer Science</i> of <a href="http://www.aut.ac.ir">Amirkabir University of Technology</a>, Iran.</p>
					<p><b>May 2005:</b> <span style="color: Green">12<sup>th</sup> rank</span>, <i>M.Sc. Nationwide Entrance Exam in Computer Science</i>, Iran.</p>
					<p><b>Nov 2003:</b> <span style="color: Green">15<sup>th</sup> team rank</span>, <i>28<sup>th</sup> ACM / International Collegiate Programming Contest</i>, Asian Region, Tehran Site.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div id="Publications" class="MyPanel NormalPanel">
				<div>Publications</div>
				<div>
					<p>
						<b><a href="http://www.jooyandeh.com">M. Jooyandeh</a></b>, Recursive Algorithms for Generation of Planar Graphs,
					<span style="font-weight: bold; font-style: italic;">PhD Thesis</span>, College of Engineering and Computer Science, Australian National University, 2014,
					<a id="lnkJooyandeh2014ThesisPdf" runat="server" class="paper-download" href="Publications/Jooyandeh2014Thesis.pdf">PDF</a>,
					<a id="lnkJooyandeh2014ThesisBib" runat="server" class="bibtex" href="Publications/Jooyandeh2014Thesis.txt">BibTeX</a>.
					</p>
					<p>
						<a href="http://www.jooyandeh.com">M. Jooyandeh</a>, <a href="http://cs.anu.edu.au/~bdm">B.D. McKay</a>,
					<a href="http://users.tkk.fi/u/pat">P.R.J. Östergård</a>, V. Pettersson, <a href="http://math.tricube.de">C.T. Zamfirescu</a>,
					Planar Hypohamiltonian Graphs on 40 Vertices, <i>Journal of Graph Theory</i>, <a href="http://dx.doi.org/10.1002/jgt.22015">DOI</a>,
					<a class="paper-download" href="http://arxiv.org/pdf/1302.2698v1">PDF</a>.
					</p>
					<p>
						<b><a href="http://www.shef.ac.uk/chemistry/staff/profiles/patrick_fowler">P.W. Folwer</a></b>,
					<a href="http://www.jooyandeh.com">M. Jooyandeh</a>,
					<a href="http://www.twi.ugent.be/index.php?page=personeel&amp;ugentid=801001807792">G. Brinkmann</a>,
					Face-Spiral Codes in Cubic Polyhedral Graphs with Face Sizes no Larger Than 6, <i>Journal of Mathematical Chemistry</i>, <b>50(8)</b> 2272--2280 (2012),
					<a href="http://dx.doi.org/10.1007/s10910-012-0029-3">DOI</a>,
					<a id="lnkFaceSpiralCodesCPGraphsFSL6Pdf" runat="server" class="paper-download" href="Publications/FaceSpiralCodesCPGraphsFSL6.pdf">PDF</a>,
					<a id="lnkFaceSpiralCodesCPGraphsFSL6Bib" runat="server" class="bibtex" href="Publications/FaceSpiralCodesCPGraphsFSL6.txt">BibTeX</a>.
					</p>
					<p>
						<b><a href="http://www.jooyandeh.com">M. Jooyandeh</a></b>, <a href="http://www.tashakori.ir">S.M. Hashemi</a>, Designing an Aspect-Oriented Persistence Layer Supporting
					Object-Oriented Querying using the .NET Framework 3.5, <i>Computing and Informatics</i>,
					<b>30(3)</b> 621--637 (2011),
					<a id="lnkDAOPSupportingOOQueryPdf" runat="server" class="paper-download" href="Publications/DAOPSupportingOOQuery.pdf">PDF</a>,
					<a id="lnkDAOPSupportingOOQueryBib" runat="server" class="bibtex" href="Publications/DAOPSupportingOOQuery.txt">BibTeX</a>.
					</p>
					<p>
						<b><a href="http://www.jooyandeh.com">M. Jooyandeh</a></b>, <a href="http://cg.aut.ac.ir/mohades">A. Mohades</a>, <a href="http://www.researchgate.net/profile/Maryam_Mirzakhah">M. Mirzakhah</a>, Uncertain Voronoi Diagram, <i>Information Proccessing Letters</i>,
					<b>109(13)</b> 709--712 (2009), <a href="http://dx.doi.org/10.1016/j.ipl.2009.03.007">DOI</a>,
					<a id="lnkUncertainVoronoiDiagramPdf" runat="server" class="paper-download" href="Publications/UncertainVoronoiDiagram.pdf">PDF</a>,
					<a id="lnkUncertainVoronoiDiagramBib" runat="server" class="bibtex" href="Publications/UncertainVoronoiDiagram.txt">BibTeX</a>.
					</p>
					<p>
						<a href="http://www.jooyandeh.com">M. Jooyandeh</a>, <a href="http://www.ipm.ac.ir/personalinfo.jsp?PeopleCode=IP0500016">D. Kiani</a>, <b><a href="http://www.researchgate.net/profile/Maryam_Mirzakhah">M. Mirzakhah</a></b>, Incidence Energy of a Graph, <i>MATCH Commun. Math. Comput. Chem.</i>,
					<b>62(3)</b> 561--572 (2009),
					<a id="A1" runat="server" class="paper-download" href="Publications/IncidenceEnergyOfAGraph.pdf">PDF</a>,
					<a id="lnkIncidenceEnergyOfAGraphBib" runat="server" class="bibtex" href="Publications/IncidenceEnergyOfAGraph.txt">BibTeX</a>.
					</p>
					<p>
						<b><a href="http://www.jooyandeh.com">M. Jooyandeh</a></b>, Designing an Aspect-Oriented Persistence Layer Supporting
					Object-Oriented Querying, <span style="font-weight: bold; font-style: italic;">M.Sc. Thesis</span>, Department of Mathematics and Computer Science, Amirkabir University of Technology, 2009, (in Persian),
					<a id="lnkJooyandeh2009ThesisBib" runat="server" class="bibtex" href="Publications/Jooyandeh2009Thesis.txt">BibTeX</a>.
					</p>
					<p>
						<b><a href="http://www.jooyandeh.com">M. Jooyandeh</a></b>, <a href="http://cg.aut.ac.ir/mohades">A. Mohades</a>, Fuzzy Voronoi Diagram, 13<sup>th</sup> International CSI Computer
							Conference (2008); <i>Advances in Computer Science and Engineering</i>, <b>6</b> 82--89
					(2009), <a href="http://dx.doi.org/10.1007/978-3-540-89985-3_10">DOI</a>,
					<a id="lnkFuzzyVoronoiDiagramPdf" runat="server" class="paper-download" href="Publications/FuzzyVoronoiDiagram.pdf">PDF</a>,
					<a id="lnkFuzzyVoronoiDiagramBib" runat="server" class="bibtex" href="Publications/FuzzyVoronoiDiagram.txt">BibTeX</a>.
					</p>
					<p>
						<a href="http://www.jooyandeh.com">M. Jooyandeh</a>, <a href="http://scholar.google.com.au/citations?sortby=pubdate&amp;user=DnueQgoAAAAJ">A. Jalali</a>,
					Scheduling of School Classes using Genetic Algorithms, <i>B.Sc. Thesis</i>, Department of Mathematics and Computer Science, Amirkabir University of Technology, Iran, 2006, (in Persian),
					<a id="lnkJooyandeh2006FinalProjectBib" runat="server" class="bibtex" href="Publications/Jooyandeh2006FinalProject.txt">BibTeX</a>.
					</p>
					<p>
						<a href="http://webdocs.cs.ualberta.ca/~behsaz/">B. Behsaz</a>, <a href="http://scholar.google.com.au/citations?sortby=pubdate&amp;user=DnueQgoAAAAJ">A. Jalali</a>, <a href="http://learnlab.uta.edu/janzadeh/">H. Janzadeh</a>, <a href="http://www.jooyandeh.com">M. Jooyandeh</a>, et al.,
					Team Description of SOS 2005, <i>RoboCup 2005</i>, Osaka, Japan, 2005, <a id="lnkTeamDescriptionOfSOS2005Bib" runat="server" class="bibtex" href="Publications/TeamDescriptionOfSOS2005.txt">BibTeX</a>.
					</p>
					<p>
						<a href="http://www.tashakori.ir">S.M. Hashemi</a>, <a href="http://scholar.google.com.au/citations?sortby=pubdate&amp;user=DnueQgoAAAAJ">A. Jalali</a>, <a href="http://www.jooyandeh.com">M. Jooyandeh</a>, et al., Rayan Team Strategy Description, <i>RoboCup 2003: Robot Soccer World Cup VII, Lecture Notes in Computer Science</i>,
						<b>3020</b> <a href="http://extras.springer.com/2004/978-3-540-22443-3/supplement/Rescue_League">(CD Supplement)</a> (2004),
						<a id="lnkRayanTeamStrategyDescriptionPdf" runat="server" class="paper-download" href="Publications/RayanTeamStrategyDescription.pdf">PDF</a>,
						<a id="lnkRayanTeamStrategyDescriptionBib" runat="server" class="bibtex" href="Publications/RayanTeamStrategyDescription.txt">BibTeX</a>.
					</p>
					<p>
						M. E. Shiri, <a href="http://scholar.google.com.au/citations?sortby=pubdate&amp;user=DnueQgoAAAAJ">A. Jalali</a>, <a href="http://www.jooyandeh.com">M. Jooyandeh</a>, et
					al., AUTRescue Team Strategy Description, <i><a href="http://sakura.meijo-u.ac.jp/ttakaHP/kiyosu/robocup/Rescue/2003/f2003.html">RoboCup 2003</a></i>, Padua, Italy, 2003,
					<a id="lnkAUTRescueTeamStrategyDescriptionPdf" runat="server" class="paper-download" href="Publications/AUTRescueTeamStrategyDescription.pdf">PDF</a>,
					<a id="lnkAUTRescueTeamStrategyDescriptionBib" runat="server" class="bibtex" href="Publications/AUTRescueTeamStrategyDescription.txt">BibTeX</a>.
					</p>
					<hr />
					<p><i>The <b>bolds</b> names in the list above indicate the corresponding author of the articles.</i></p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div id="GrantsScholarshipsSupports" class="MyPanel SpecialPanel6">
				<div>Grants, Scholarships and Supports</div>
				<div>
					<p><b>2010-2014</b>: <span style="color: Green">$30K</span>, ANU Tuition Fee Sponsorship.</p>
					<p><b>2010-2014</b>: <span style="color: Green">$22K</span>, ANU PhD International Scholarship.</p>
					<p><b>Aug 2011</b>: <span style="color: Green">$3000</span>, ANU Vice-Chancellor Travel Grant for visiting <a href="http://www.twist.ugent.be/index.php?page=personeel&amp;ugentid=801001807792">Prof. Gunnar Brinkmann</a> at <a href="http://www.ugent.be/en">Ghent University</a>.</p>
					<p><b>Dec 2011</b>: <span style="color: Green">$400</span>, Student Support from the <a href="http://users.monash.edu.au/~accmcc/">35<sup>th</sup> Australasian Conference on Combinatorial Mathematics & Combinatorial Computing</a>.</p>
					<p><b>Dec 2012</b>: <span style="color: Green">$300</span>, Student Support from the <a href="http://conferences.science.unsw.edu.au/36accmcc/">36<sup>th</sup> Australasian Conference on Combinatorial Mathematics & Combinatorial Computing</a>.</p>
				</div>
			</div>

			<div id="Visits" class="MyPanel SpecialPanel5">
				<div>Academic Visits</div>
				<div>
					<ul>
						<li><a href="http://www.cs.uleth.ca/~hadi/">Prof. H. Kharaghani</a> at <a href="http://www.uleth.ca">University of Lethbridge</a>, Canada (Jan 2014).</li>
						<li><a href="http://www.ipm.ac.ir/personalinfo.jsp?PeopleCode=IP9900152">Prof. G.B. Khosrovshahi</a> at <a href="http://www.ipm.ac.ir">Institute for Research in Fundamental Sciences (IPM)</a>, Iran (Oct - Nov 2013).</li>
						<li><a href="http://www.csdila.unimelb.edu.au/people/rteam/abbas.html">Prof. A. Rajabifard</a> at <a href="http://www.unimelb.edu.au">University of Melbourne</a>, Australia (Jun 2012).</li>
						<li><a href="http://www.twist.ugent.be/index.php?page=personeel&amp;ugentid=801001807792">Prof. G. Brinkmann</a> at <a href="http://www.ugent.be/en">Ghent University</a>, Belgium (Dec 2011 - Mar 2012).</li>
					</ul>
				</div>
			</div>

			<div id="AcademicPositions" class="MyPanel NormalPanel">
				<div>Academic Positions</div>
				<div>
					<ul>
						<li>
							<b><a href="http://www.anu.edu.au">Australian National University</a></b>
							<ul>
								<li>
									<b>Lecturer, <a href="http://cs.anu.edu.au/student/comp3630/">Theory of Computation</a>, 2011</b>
									<br />
									Course Coordinator: <a href="http://cs.anu.edu.au/~bdm/">Prof. Brendan McKay</a>
								</li>
								<li>
									<b>Teacher Assistant, <a href="http://cs.anu.edu.au/student/comp3600/">Algorithms</a>, 2010-2012</b>
									<br />
									Course Coordinator: <a href="http://cs.anu.edu.au/~Weifa.Liang/">Prof. Weifa Liang</a>
								</li>
							</ul>
						</li>
						<li>
							<b><a href="http://aut.ac.ir">Amirkabir University of Technology</a></b>
							<ul>
								<li><b>Teaching Assistant, Theory of Computer Science, 2006</b></li>
								<li><b>Teaching Assistant, C++ Programming, 2005</b></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<div id="TalksAndSeminars" class="MyPanel SpecialPanel4">
				<div>Talks</div>
				<div>
					<ul>
						<li>
							<b>Recusrive Algorithms for Generation of Planar Graphs</b>
							<ul>
								<li>Lethbridge Number Theory and Combinatorics Seminar, <a href="http://www.pims.math.ca/scientific-event/140127-lntcsmj">University of Lethbridge</a>, Canada, Jan 2014.</li>
								<li>Centre for Computational and Discrete Geometry, <a href="http://math.ucalgary.ca/ccdg/%5Btermpath-raw%5D/recursive-algorithms-generation-planar-graphs">University of Calgary</a>, Canada, Mar 2014.</li>
								<li>IPM Weekly Combinatoics Seminar, Institute for Research in Fundamental Sciences <a href="http://math.ipm.ac.ir">(IPM)</a>, Iran, Nov 2013.</li>
							</ul>
						</li>
						<li>
							<b>Planar Hypohamiltonian Graphs on 40 Vertices</b>
							<ul>
								<li>36<sup>th</sup> Australasian Conference on Combinatorial Mathematics & Combinatorial Computing <a href="http://conferences.science.unsw.edu.au/36accmcc/">(36ACCMCC)</a>, University of New South Wales, Australia, Dec 2012 <span style="color: red">(Best Student Talk Award)</span>.</li>
							</ul>
						</li>
						<li>
							<b>Recursive Generation of Plane Graphs Based upon Their Faces</b>
							<ul>
								<li><a href="http://www.twi.ugent.be/index.php?page=home">Department of Applied Mathematics and Computer Science</a>, Ghent University, Belgium, Jan 2011.</li>
								<li>35<sup>th</sup> Australasian Conference on Combinatorial Mathematics & Combinatorial Computing <a href="http://users.monash.edu.au/~accmcc/">(35ACCMCC)</a>, Monash University, Australia, Dec 2011.</li>
							</ul>
						</li>
						<li>
							<b>Generation of Pentangulations</b>
							<ul>
								<li>34<sup>th</sup> Australasian Conference on Combinatorial Mathematics & Combinatorial Computing <a href="http://www.maths.uq.edu.au/CMSA/">(34ACCMCC)</a>, Australian National University, Australia, Dec 2010 <span style="color: red">(Top-Three Shortlist for the Best Student Talk)</span>.</li>
								<li><a href="http://cs.anu.edu.au">Research School of Computer Science</a>, Australian National University, Australia, Nov 2010.</li>
							</ul>
						</li>
						<li>
							<b>Graph Generation</b>
							<ul>
								<li><a href="http://cs.anu.edu.au">Research School of Computer Science</a>, Australian National University, Australia, Apr 2010.</li>
							</ul>
						</li>
						<li>
							<b>Designing an Aspect-Oriented Persistence Layer Supporting Object-Oriented Querying</b>
							<ul>
								<li>Department of Mathematics and Computer Science, <a href="http://math.aut.ac.ir">Amirkabir University of Technology</a>, Iran, Nov 2008.</li>
							</ul>
						</li>
						<li>
							<b>Fuzzy Voronoi Diagram</b>
							<ul>
								<li>13<sup>th</sup> International CSI Computer Conference <a href="http://www.springerlink.com/content/978-3-540-89984-6">(CSICC'08)</a>, Sharif University of Technology (International Campus), Iran, Mar 2008.</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div id="TechnicalSkills" class="MyPanel NormalPanel">
				<div>Technical Skills</div>
				<div>
					<div>
						<b class="bigText">Programming skills</b>
						<ul>
							<li>Programming Languages: Proficient in <a href="http://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29">C#</a>, <a href="http://en.wikipedia.org/wiki/Visual_C%2B%2B">VC++</a>, <a href="http://en.wikipedia.org/wiki/C%2B%2B">C++</a>, <a href="http://en.wikipedia.org/wiki/C_%28programming_language%29">C</a>
								and Familiar with <a href="http://en.wikipedia.org/wiki/Java_%28programming_language%29">Java</a>, <a href="http://en.wikipedia.org/wiki/Pascal_%28programming_language%29">Pascal</a>,
									<a href="http://en.wikipedia.org/wiki/Delphi_programming_language">Delphi</a></li>
							<li>Proficient in Web Programming with <a href="http://en.wikipedia.org/wiki/ASP.NET">ASP.NET</a>, <a href="http://en.wikipedia.org/wiki/HTML5">HTML5</a>, <a href="http://en.wikipedia.org/wiki/Cascading_Style_Sheets">CSS</a> and JavaScript</li>
							<li>Proficient in <a href="http://en.wikipedia.org/wiki/Common_Object_Request_Broker_Architecture">CORBA</a> programming with C++ (Have many experiences with <a href="http://en.wikipedia.org/wiki/IONA_Technologies">Orbacus</a> and some with <a href="http://en.wikipedia.org/wiki/Orbix">Orbix</a>)</li>
							<li>Proficient in <a href="http://en.wikipedia.org/wiki/Component_Object_Model">COM</a>
								programming in VC++ and C#</li>
							<li>Experienced in <a href="http://msdn.microsoft.com/en-us/library/zbz07712%28VS.80%29.aspx">.NET/C++ Interoperability</a></li>
							<li>Proficient in <a href="http://en.wikipedia.org/wiki/.NET_Framework">.NET</a> Programming
									and Familiar with <a href="http://en.wikipedia.org/wiki/Windows_Presentation_Foundation">Windows Presentation Foundation</a>, <a href="http://en.wikipedia.org/wiki/Windows_Communication_Foundation">Windows Communication Foundation</a>, <a href="http://en.wikipedia.org/wiki/Windows_Workflow_Foundation">Windows Workflow Foundation</a> and <a href="http://en.wikipedia.org/wiki/M_%28programming_language%29">M</a> </li>
							<li>Proficient in <a href="http://en.wikipedia.org/wiki/Windows_API">Win 32 API</a>/<a
								href="http://en.wikipedia.org/wiki/Microsoft_Foundation_Class_Library">MFC</a> Programming</li>
							<li>Experienced in Linux Programming</li>
							<li>Experienced in Socket Programming</li>
						</ul>
					</div>
					<div>
						<b class="bigText">Technologies/Tools</b>
						<ul>
							<li>Proficient in <a href="http://en.wikipedia.org/wiki/Language_Integrated_Query">LINQ
									(Language Integrated Query)</a></li>
							<li>Experienced in <a href="http://en.wikipedia.org/wiki/.NET_Remoting">.NET Remoting</a>
								technology and architecture</li>
							<li>Experienced in <a href="http://en.wikipedia.org/wiki/Web_service">Web Service</a>
								technology and architecture</li>
							<li>Experienced in <a href="http://en.wikipedia.org/wiki/Microsoft_SQL_Server">MS SQL
									Server</a> Programming and Administration</li>
						</ul>
					</div>
					<div>
						<b class="bigText">Data Structures, Algorithms, and Graph Theory</b>
						<ul>
							<li><b>Experienced in development of graph algorithms</b><br />
								I am working on a <a href="Combinatorics/GraphLibrary.aspx">graph library</a>
								which computes some of the properties of simple graphs and also produces the graphs
									of order at most 10 which uses <a href="http://cs.anu.edu.au/~bdm/">Prof. McKay</a>'s
									<a href="http://cs.anu.edu.au/~bdm/data/">combinatorial data</a> as input. </li>
							<li><b>Experienced in development of computational geometry algorithms</b><br />
								I developed a <a href="ComputationalGeometry/RandomSimplePolygonGenerator.aspx">random
										simple polygon generator</a> and a computational geometry library to compare
									some art-gallery algorithms. </li>
						</ul>
					</div>
					<div>
						<b class="bigText">Digital Typography</b>
						<ul>
							<li>Proficient in <a href="http://www.latex-project.org">LaTeX</a> and <a href="http://www.farsitex.org">FTeX</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div id="Memberships" class="MyPanel SpecialPanel6">
				<div>Affiliations and Memberships</div>
				<div>
					<ul>
						<li>
							<b class="bigText">Academic Affiliations</b>
							<ul>
								<li>
									<a href="http://www.anu.edu.au">Australian National University</a>
									<ul>
										<li>
											<b>Member of the <a href="http://cs.anu.edu.au/research/algorithms">Algorithms & Data Research Group</a></b> (2010-2014).
										</li>
										<li>
											<b>Member of <a href="http://cs.anu.edu.au/study/currentstudents/src">Student Representative Commitee</a></b> of School of Computer Science (2012-2013).
										</li>
										<li>
											<b><a href="https://cecs.anu.edu.au/current_students/graduates/mentors">Mentor of PhD Students</a></b> of College of Engineering and Computer Science.
										</li>
										<li>
											<b>Mentor at <a href="http://www.anu.edu.au/sign/">SIGN Mentoring Program</a></b> (2010-2012).
										</li>
									</ul>
								</li>
								<li>
									<a href="http://www.aut.ac.ir">Amirkabir University of Technology</a>
									<ul>
										<li>
											<b>Chairman of Math and Computer Science Scientific Association <a href="https://www.facebook.com/samathcs">(SAMCS)</a></b> (2004-2005).
										</li>
										<li>
											<b>Member of S.O.S Team</b> A team which was working on management of rescue robots in a simulated environment (2004-2005).
										</li>
										<li>
											<b>Member of Math and Computer Science Scientific Association <a href="https://www.facebook.com/samathcs">(SAMCS)</a></b> (2003-2004).
										</li>
										<li>
											<b>Member of Rayan Rescue Team</b> A team which was working on management of rescue robots in a simulated environment (2002-2004).
										</li>
									</ul>
								</li>
							</ul>
						</li>
						<li>
							<b class="bigText">Non-Academic Membership</b>
							<ul>
								<li><b>Member of the CECS United Soccer Team</b> of the ANU College of Engineering & Computer Science (2010-2013).</li>
								<li><b>Member of the <a href="http://www.anuvc.org.au/teams.php?teamname=Phoenix">ANU Phoenix</a> Team</b> of the <a href="http://www.anuvc.org.au">ANU Volleyball Club</a>, Participating in the Division One of the ACT Volleyball League (2010).</li>
								<li><b>Member of the Soccer Team</b> of the Department of Mathematics and Computer Science of Amirkabir University of Technology (2004-2005).</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<div id="Photography" class="MyPanel SpecialPanel1">
				<div>Photography</div>
				<div>
					<ul>
						<li>
							<a href="Photos/Panorama/Lake_Burley_Griffin01.jpg" runat="server" id="LakeBurleyGriffin01">White Heart Black Swans</a>
							displayed at In My Eye Exhibition, Canberra, Australia, 2012.
						</li>
						<li>
							<a href="Photos/Panorama/Canberra_From_Red_Hill.jpg" runat="server" id="CanberraFromRedHill">View of Canberra from Red Hill</a>
						</li>
						<li>
							<a href="Photos/Panorama/Corin_Dam.jpg" runat="server" id="CorinDam">Corin Dam</a>
						</li>
						<li>
							<a href="Photos/Panorama/Floriade2010.jpg" runat="server" id="Floriade2010">Floriade
								2010 (Australia's Celebration of Spring)</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		var page = new Page();

		page.onReady.push(function () {
			EmailObfuscator.writeEmailTo("noscript-email");
		});
	</script>
</asp:Content>

