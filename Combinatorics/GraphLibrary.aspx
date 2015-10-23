<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GraphLibrary.aspx.cs" Inherits="Combinatorics_GraphLibrary" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="TitleContent" ContentPlaceHolderID="title" runat="Server">Gemini Graph Library</asp:Content>
<asp:Content ID="SubtitleContent" ContentPlaceHolderID="subtitle" runat="server">Gemini Graph Library</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="pageContent" runat="Server">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel1">
				<div>Summary</div>
				<div>
					<p>
						<b>Gemini Graph Library (GGL)</b> is a library for working with simple graphs and is written in C# 3.5.<br />
						GGL is a part of Gemini Library which is not completely released yet.
					</p>
					<p>
						So far I did not provide any documentation for GGL, but it will be available here as well as it becomes ready.
					</p>
				</div>
			</div>

			<div class="MyPanel NormalPanel">
				<div>How to get</div>
				<div>
					<p>
						If you agree to the restrictions listed below, you may fetch version 1.0.3560 (latest version) of <b>GGL</b> as
						<a id="SrcCode" runat="server" href="../GeminiLibrary/Combinatorics.Graph/1.0.3560/Gemini.Combinatorics.Graph-src.zip">source zip file (297 KB)</a> or
						<a id="BinCode" runat="server" href="../GeminiLibrary/Combinatorics.Graph/1.0.3560/Gemini.Combinatorics.Graph-bin.zip">binary zip file (273 KB)</a>.
					</p>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="MyPanel NormalPanel">
				<div>Restrictions</div>
				<div>
					<p>
						<b>Gemini Graph Library</b> is subject to the following usage restrictions:<br />
						Copyright (2008-2015) Mohammadreza Jooyandeh. All rights reserved. Permission is
						hereby given for use and/or distribution with the exception of sale for profit
						or application with nontrivial military significance. You must not remove this
						copyright notice, and you must document any changes that you make to this
						program. This software is subject to this copyright only, irrespective of any
						copyright attached to any package of which this is a part. Absolutely no
						guarantees or warranties are made concerning the suitability, correctness, or
						any other aspect of this program. Any use is at your own risk.
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="MyPanel SpecialPanel6">
				<div>Author</div>
				<div>
					<p>
						<a href="http://www.jooyandeh.com">Mohammadreza Jooyandeh</a>
						<br /><span id="noscript-email">JavaScript must be enabled to display this email address.</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>
		EmailObfuscator.writeEmailTo("noscript-email");
	</script>
</asp:Content>

