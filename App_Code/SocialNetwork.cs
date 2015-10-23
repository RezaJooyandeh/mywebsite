public class SocialNetwork
{
	public static string GenerateHtml()
	{
		return
			"<table class=\"NoPaddingSpacingTable\" style=\"text-align: center\">\n" +
				"\t<tr>\n" +
					"\t\t<td>\n" +
						"\t\t\t<div id=\"fb-root\"></div>\n" +
						"\t\t\t<script type=\"text/javascript\">\n" +
							"\t\t\t\twindow.fbAsyncInit = function () {\n" +
								"\t\t\t\t\tFB.init({\n" +
									"\t\t\t\t\t\tappId: '349080618465305', // App ID\n" +
									"\t\t\t\t\t\tchannelUrl: '//www.jooyandeh.com/channel.html', // Channel File\n" +
									"\t\t\t\t\t\tstatus: true, // check login status\n" +
									"\t\t\t\t\t\tcookie: true, // enable cookies to allow the server to access the session\n" +
									"\t\t\t\t\t\txfbml: true  // parse XFBML\n" +
								"\t\t\t\t\t});\n\n" +
							"\t\t\t\t};\n" +
							"\t\t\t\t// Load the SDK Asynchronously\n" +
							"\t\t\t\t(function (d) {\n" +
								"\t\t\t\t\tvar js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];\n" +
								"\t\t\t\t\tif (d.getElementById(id)) { return; }\n" +
								"\t\t\t\t\tjs = d.createElement('script'); js.id = id; js.async = true;\n" +
								"\t\t\t\t\tjs.src = \"//connect.facebook.net/en_US/all.js\";\n" +
								"\t\t\t\t\tref.parentNode.insertBefore(js, ref);\n" +
							"\t\t\t\t} (document));\n" +
						"\t\t\t</script>\n" +
						"\t\t\t<script type=\"text/javascript\">\n" +
							"\t\t\t\t(function (d, s, id) {\n" +
								"\t\t\t\t\tvar js, fjs = d.getElementsByTagName(s)[0];\n" +
								"\t\t\t\t\tif (d.getElementById(id)) return;\n" +
								"\t\t\t\t\tjs = d.createElement(s); js.id = id;" +
								"\t\t\t\t\tjs.src = \"//connect.facebook.net/en_GB/all.js#xfbml=1\";\n" +
								"\t\t\t\t\tfjs.parentNode.insertBefore(js, fjs);\n" +
							"\t\t\t\t} (document, 'script', 'facebook-jssdk'));\n" +
						"\t\t\t</script>\n" +
						"\t\t\t<div class=\"fb-like\" data-href=\"https://www.facebook.com/Jooyandeh.Website\" data-send=\"false\" data-width=\"280\" data-show-faces=\"true\" data-font=\"verdana\"></div>\n" +
					"\t\t</td>\n" +
				"\t</tr>\n" +
				"\t<tr>\n" +
					"\t\t<td style=\"padding-top: 10px\">\n" +
						"\t\t\t<div class=\"g-plusone\"></div>\n" +
						"\t\t\t<script type=\"text/javascript\">\n" +
							"\t\t\t\t(function () {\n" +
								"\t\t\t\t\tvar po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;\n" +
								"\t\t\t\t\tpo.src = 'https://apis.google.com/js/plusone.js';\n" +
								"\t\t\t\t\tvar s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);\n" +
							"\t\t\t\t})();\n" +
						"\t\t\t</script>\n" +
					"\t\t</td>\n" +
				"\t</tr>\n" +
			"</table>\n";
	}
}