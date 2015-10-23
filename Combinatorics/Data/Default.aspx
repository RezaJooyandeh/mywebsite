<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Combinatorics_Data_Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
	<script type="text/javascript" src="Scripts/SampleGraphs.js"></script>
</asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="title" runat="Server">Combinatorial Data</asp:Content>
<asp:Content ID="SubtitleContent" ContentPlaceHolderID="subtitle" runat="server">Combinatorial Data</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" runat="Server">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel6">
				<div>Simple k-Angulations</div>
				<div>
					Simple <i>k</i>-Angulations is the family of simple 2-connected <a href="http://en.wikipedia.org/wiki/Planar_graph">plane graphs</a> such that all faces (including the outer face) have size equal
					to the <i>k</i>. <a href="K-Angulations.aspx">This page</a> contains the exhaustive list of <i>k</i>-angulations
					for <i>k=3,4,5,6,7,8,9,10</i> of small orders.
					<br />
					<br />
					<div style="padding-top: 15px; padding-bottom: 10px; text-align: center">
						<b><a href="K-Angulations.aspx">More Details and Files ...</a></b>
					</div>
					<div id="noscript2" style="text-align: center">JavaScript must be enabled to display these examples.</div>
					<div style="display: inline-table; width: 100%; text-align: center">
						<div style="display: table-cell; width: 33%;">
							<div id="Ang03_04"></div>
							<div id="Ang03_05"></div>
							<div id="Ang03_06"></div>
							<div id="Ang03_07"></div>
						</div>
						<div style="display: table-cell; width: 33%;">
							<div id="Ang04_05"></div>
							<div id="Ang04_06"></div>
							<div id="Ang04_07"></div>
							<div id="Ang04_08"></div>
						</div>
						<div style="display: table-cell; width: 33%;">
							<div id="Ang05_08"></div>
							<div id="Ang05_11"></div>
							<div id="Ang05_14"></div>
							<div id="Ang05_17"></div>
						</div>
						<script type="text/javascript">
							var nos2 = document.getElementById("noscript2");
							nos2.parentNode.removeChild(nos2);
							DrawGraph("Ang03_04", Ang03_04, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang03_05", Ang03_05, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang03_06", Ang03_06, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang03_07", Ang03_07, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang04_05", Ang04_05, Ang_Drawing_Settings, "0.95in", "0.95in");
							DrawGraph("Ang04_06", Ang04_06, Ang_Drawing_Settings, "0.95in", "0.95in");
							DrawGraph("Ang04_07", Ang04_07, Ang_Drawing_Settings, "0.95in", "0.95in");
							DrawGraph("Ang04_08", Ang04_08, Ang_Drawing_Settings, "0.95in", "0.95in");
							DrawGraph("Ang05_08", Ang05_08, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang05_11", Ang05_11, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang05_14", Ang05_14, Ang_Drawing_Settings, "1.1in", "0.95in");
							DrawGraph("Ang05_17", Ang05_17, Ang_Drawing_Settings, "1.1in", "0.95in");
						</script>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel1">
				<div>Planar Hypohamiltonian Graphs</div>
				<div>
					Planar <a href="http://en.wikipedia.org/wiki/Hypohamiltonian_graph">hypohamiltonian
					graphs</a> are the family of <a href="http://en.wikipedia.org/wiki/Planar_graph">plane
					graphs</a> that are not <a href="http://en.wikipedia.org/wiki/Hamiltonian_graph">hamiltonian</a>
					but removing any vertex make them hamiltonian. <a href="PlanarHypohamiltonian.aspx">This page</a> contains a list of smallest
					known planar hypohamiltonian graphs.
					<br />
					<br />
					<div style="padding-top: 15px; padding-bottom: 10px; text-align: center">
						<b><a href="PlanarHypohamiltonian.aspx">More Details and Files ...</a></b>
					</div>
					<div id="noscript1" style="text-align: center">JavaScript must be enabled to display this example.</div>
					<div id="imgHypoMain" style="text-align: center">
					</div>
					<div id="imgHypoChildren" style="text-align: justify; padding-top: 20px;"></div>
					<script type="text/javascript">
						var nos1 = document.getElementById("noscript1");
						nos1.parentNode.removeChild(nos1);
						DrawGraph("imgHypoMain", Hypo_40, Hypo_Drawing_Settings, "2in", "2in");
						DrawHypoGraphAllCycle("imgHypoChildren", Hypo_40, Hypo_Drawing_Settings, "1in", "1in");
					</script>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

