﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EastlawUI_v2.adminpanel
{
    public partial class BackendActivityLog : System.Web.UI.Page
    {
        EastLawBL.Users objUsr = new EastLawBL.Users();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("default.aspx");
                }
                if (!ValidateUserGroup.ValidateGroup(int.Parse(Session["UserTypeID"].ToString()), ValidateUserGroup.getPageName(Request.Url.AbsolutePath)))
                    Response.Redirect("NotAuthorize.aspx");
                GetAuditLogs(0);
            }
        }
        void GetAuditLogs(int ID)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = objUsr.GetBackendAuditLog(ID);
                if (ID == 0)
                {
                    dt.AcceptChanges();
                    gv.DataSource = dt;
                    gv.DataBind();
                }
                else
                {


                }
            }
            catch (Exception e)
            {
               
            }
        }
        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gv.PageIndex = e.NewPageIndex;
                GetAuditLogs(0);
            }
            catch (Exception ex)
            {
               
            }
        }
    }
}