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
    public partial class AddSubject : System.Web.UI.Page
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
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                string addSubject = "insert into Subject (Subjectname, Sem, Credit, Branch) values (@subjectname, @sem, @credit, @branch)";
                SqlCommand comm = new SqlCommand(addSubject, conn);
                comm.Parameters.AddWithValue("@subjectname", TextBox1.Text);
                comm.Parameters.AddWithValue("@sem", TextBox2.Text);
                comm.Parameters.AddWithValue("@credit", TextBox3.Text);
                comm.Parameters.AddWithValue("@branch", TextBox4.Text);
                comm.ExecuteNonQuery();
                Response.Redirect("Courses.aspx");
                Response.Write("Subject Added");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}