using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace MovieStore.Web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Session_Start(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }


        protected void Application_Start(object sender, EventArgs e)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
              | SecurityProtocolType.Tls11
              | SecurityProtocolType.Tls12
              | SecurityProtocolType.Ssl3;

            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
        }


        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                Exception ex = Server.GetLastError();

                HttpException httpException = (HttpException)ex;

                int httpCode = httpException.GetHttpCode();

                switch (httpCode)
                {
                    case 404:
                        Response.Redirect("Error404.aspx");
                        break;
                    case 403:
                        Response.Redirect("Error403.aspx");
                        break;
                    default:
                        Response.Redirect("Error.aspx");
                        break;
                }
            }
            catch
            {

            }
        }


        protected void Application_StartRequest(object sender, EventArgs e)
        {
            setHttpOnlyCookies();
        }


        protected void Application_EndRequest(object sender, EventArgs e)
        {
            setHttpOnlyCookies();
        }

        private void setHttpOnlyCookies()
        {
            var cookieConfig = ConfigurationManager.GetSection("system.web/httpCookies") as System.Web.Configuration.HttpCookiesSection;

            if (cookieConfig != null)
            {
                for (int i = 0; i < Response.Cookies.Count; i++)
                    Response.Cookies[i].HttpOnly = cookieConfig.HttpOnlyCookies;
            }
        }
    }
}