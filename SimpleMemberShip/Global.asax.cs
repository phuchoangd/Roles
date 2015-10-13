﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using WebMatrix.WebData;
using WebMatrix.Data;
using System.Web.Security;
using SimpleMemberShip.Models;

namespace SimpleMemberShip
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            //WebSecurity.InitializeDatabaseConnection("Membership", "UserProfile", "UserId", "Username", true);
        }
        //protected void FormsAuthentication_OnAuthenticate(Object sender, FormsAuthenticationEventArgs e)
        //{
        //    if (FormsAuthentication.CookiesSupported == true)
        //    {
        //        if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
        //        {
        //            try
        //            {
        //                //let us take out the username now                
        //                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
        //                string roles = string.Empty;

        //                using (RolesModel entities = new RolesModel())
        //                {
        //                    User user = entities.Users.SingleOrDefault(u => u.Username == username);

        //                    roles = user.RoleID.ToString();
        //                }
        //                //let us extract the roles from our own custom cookie


        //                //Let us set the Pricipal with our user specific details
        //                e.User = new System.Security.Principal.GenericPrincipal(
        //                  new System.Security.Principal.GenericIdentity(username, "Forms"), roles.Split(';'));
        //            }
        //            catch (Exception)
        //            {
        //                //somehting went wrong
        //            }
        //        }
        //    }
        //}
        protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        {
            if (FormsAuthentication.CookiesSupported == true)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    try
                    {
                        //let us take out the username now                
                        string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                        string roles = string.Empty;

                        using (RolesModel entities = new RolesModel())
                        {
                            User user = entities.Users.SingleOrDefault(u => u.Username == username);

                            roles = user.RoleID.ToString();
                        }
                        //let us extract the roles from our own custom cookie


                        //Let us set the Pricipal with our user specific details
                        HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(
                          new System.Security.Principal.GenericIdentity(username, "Forms"), roles.Split(';'));
                    }
                    catch (Exception)
                    {
                        //somehting went wrong
                    }
                }
            }
        } 
    }
}