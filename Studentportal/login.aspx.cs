using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Studentportal
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IsLogin"] = 0;
            Session["IsAdmin"] = 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand checkAdmin = new SqlCommand("Select count(*) from Student where Id=@aid AND Birthdate=@abirth", conn);
                checkAdmin.Parameters.AddWithValue("@aid", TextBox1.Text);
                checkAdmin.Parameters.AddWithValue("@abirth", TextBox2.Text);
                checkAdmin.ExecuteNonQuery();
                int admin = Convert.ToInt32(checkAdmin.ExecuteScalar().ToString());
                int t1 = Convert.ToInt32(TextBox1.Text);
                if (admin == 1 && t1 == 1 && TextBox2.Text == "AdminSCM")
                {
                    HttpContext.Current.Session["IsLogin"] = 1;
                    HttpContext.Current.Session["IsAdmin"] = 1;
                    Response.Redirect("Admin.aspx");
                }

                SqlCommand comm = new SqlCommand("select count(*) from Student where Id=@id AND Birthdate=@birth", conn);
                comm.Parameters.AddWithValue("@id", TextBox1.Text);
                comm.Parameters.AddWithValue("@birth", TextBox2.Text);
                comm.ExecuteNonQuery();
                int temp = Convert.ToInt32(comm.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    HttpContext.Current.Session["IsLogin"] = 1;
                    string url = "StudentInfo.aspx?id=" + TextBox1.Text;
                    Response.Redirect(url);
                    Response.Write("Login Successfully");
                }
                else
                {
                    Response.Write("<script> alert('Invalid Information') </script>");
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}
