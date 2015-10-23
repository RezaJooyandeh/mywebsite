using System;
using System.Web.UI.HtmlControls;

public partial class Site : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		var googleSiteVerificationMeta = new HtmlMeta { Name = "google-site-verification" };

		if (Request.IsDotInfo())
		{
			googleSiteVerificationMeta.Content = "6M9JTp1F2QTbPqYFmcJnf06iUb8RSsA6QOc_wQ_8";

			if (!Request.IsRobot() || (Page.Request.AppRelativeCurrentExecutionFilePath.ToLower() != "~/default.aspx"))
			{
				var oldUri = Request.Url.AbsoluteUri.ToLower();
				Response.RedirectPermanent(oldUri.Replace("jooyandeh.info", "jooyandeh.com"));
			}
		}
		else if (Request.IsDotCom())
		{
			googleSiteVerificationMeta.Content = "jJh_5Te44yV12kapDQNEfYp32gejcxXdVIXEjVJIu4g";
		}
		else if (Request.IsOnAzureProd())
		{
			googleSiteVerificationMeta.Content = "leZeHIkj_1Av8w090g9O6rNaBzxgqOevyf8CpCFuiGk";
		}
		else if (Request.IsOnAzureDev())
		{
			googleSiteVerificationMeta.Content = "leZeHIkj_1Av8w090g9O6rNaBzxgqOevyf8CpCFuiGk";
		}

		if (googleSiteVerificationMeta.Content != string.Empty)
			Page.Header.Controls.Add(googleSiteVerificationMeta);

		if (Request.IsOnAzure())
		{
			Page.Header.Controls.Add(new HtmlMeta { Name = "robots", Content = "noindex" });
		}
	}
}
