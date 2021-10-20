using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Studentportal
{
    public partial class MyCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)HttpContext.Current.Session["IsLogin"] == 0)
            {
                Response.Write("<script>alert('Please Login')</script>");
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }

        void LoadRecord()
        {
            try
            {
                int sem = (int)HttpContext.Current.Session["Sem"];
                string branch = (string)HttpContext.Current.Session["Branch"];
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                string getSubject = "select Subjectname, Sem, Credit, Branch from Subject where Sem=@s AND Branch=@b";
                SqlCommand comm = new SqlCommand(getSubject, conn);
                comm.Parameters.AddWithValue("@s", sem);
                comm.Parameters.AddWithValue("@b", branch);
                comm.ExecuteNonQuery();
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadRecord();
        }
    }
}