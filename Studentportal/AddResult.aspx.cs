using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Studentportal
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)HttpContext.Current.Session["IsAdmin"] == 0)
            {
                int Id = (int)HttpContext.Current.Session["Id"];
                Response.Write("<script>alert('Can't Go to That page')</script>");
                string url = "StudentInfo.aspx?id=" + Id;
                Response.Redirect(url);
            }
            if ((int)HttpContext.Current.Session["IsLogin"] == 0)
            {
                Response.Write("<script>alert('Please Login')</script>");
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int id = (int)HttpContext.Current.Session["Id"];
                int sem = (int)HttpContext.Current.Session["Sem"];
                string branch = (string)HttpContext.Current.Session["Branch"];
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand comm = new SqlCommand("Insert Into Marks (Studentid,Sem,Branch,Subjectname,Maxmarks,Marks) values (@studentid,@sem,@branch,@subjectname,@maxmarks,@marks)", conn);
                comm.Parameters.AddWithValue("@studentid", id);
                comm.Parameters.AddWithValue("@sem", sem.ToString());
                comm.Parameters.AddWithValue("@branch", branch.ToString());
                comm.Parameters.AddWithValue("@subjectname", TextBox1.Text);
                comm.Parameters.AddWithValue("@maxmarks", TextBox2.Text);
                comm.Parameters.AddWithValue("@marks", TextBox3.Text);
                comm.ExecuteNonQuery();
                string url = "StudentInfo.aspx?id=" + id;
                Response.Redirect(url);
                Response.Write("Subject Updated");
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}