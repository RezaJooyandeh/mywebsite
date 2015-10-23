using System.Web;

public class MyName
{
	public static string GetFullName(HttpRequest request)
	{
		return request.IsDotInfo() ? "Mohammadreza Jooyandeh" : "Reza Jooyandeh";
	}
}