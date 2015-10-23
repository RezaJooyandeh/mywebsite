using System.Text.RegularExpressions;
using System.Web;

public static class RequestExtensions
{
	public static bool IsDotInfo(this HttpRequest self)
	{
		var url = self.Url.AbsoluteUri.ToLower();
		return url.StartsWith("http://www.jooyandeh.info") || url.StartsWith("http://jooyandeh.info");
	}
	public static bool IsDotCom(this HttpRequest self)
	{
		var url = self.Url.AbsoluteUri.ToLower();
		return url.StartsWith("http://www.jooyandeh.com") || url.StartsWith("http://jooyandeh.com");
	}
	public static bool IsOnAzureProd(this HttpRequest self)
	{
		var url = self.Url.AbsoluteUri.ToLower();
		return url.StartsWith("http://reza.azurewebsites.net");
	}
	public static bool IsOnAzureDev(this HttpRequest self)
	{
		var url = self.Url.AbsoluteUri.ToLower();
		return url.StartsWith("http://geminitest.azurewebsites.net");
	}
	public static bool IsOnAzure(this HttpRequest self)
	{
		return self.IsOnAzureDev() || self.IsOnAzureProd(); ;
	}

	public static bool IsRobot(this HttpRequest self)
	{
		return Regex.IsMatch(self.UserAgent, @"bot|crawler|baiduspider|80legs|ia_archiver|voyager|curl|wget|yahoo! slurp|mediapartners-google", RegexOptions.IgnoreCase);
    }
}