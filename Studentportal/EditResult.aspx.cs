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
    public partial class EditResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)HttpContext.Current.Session["IsAdmin"] == 0)
            {
                int i = (int)HttpContext.Current.Session["Id"];
                Response.Write("<script>alert('Can't Go to That page')</script>");
                string url = "StudentInfo.aspx?id=" + i;
                Response.Redirect(url);
            }
            if ((int)HttpContext.Current.Session["IsLogin"] == 0)
            {
                Response.Write("<script>alert('Please Login')</script>");
                Response.Redirect("Login.aspx");
            }
            int Id = Convert.ToInt32(Request.QueryString["id"].ToString());
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                    conn.Open();
                    string getMarks = "select Subjectname, Maxmarks, Marks from Marks where Id=@mid";
                    SqlCommand comm = new SqlCommand(getMarks, conn);
                    comm.Parameters.AddWithValue("@mid", Id);
                    comm.ExecuteNonQuery();
                    SqlDataReader dr = comm.ExecuteReader();
                    if (dr.Read())
                    {
                        TextBoxID.Text = Id.ToString();
                        TextBox1.Text += dr["Subjectname"].ToString();
                        TextBox2.Text += dr["Maxmarks"].ToString();
                        TextBox3.Text += dr["Marks"].ToString();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.ToString());
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                string editStudent = "update Marks set Subjectname=@subjectname, Maxmarks=@maxmarks, Marks=@marks where Id='" + TextBoxID.Text + "'";
                SqlCommand comm = new SqlCommand(editStudent, conn);
                comm.Parameters.AddWithValue("@subjectname", TextBox1.Text);
                comm.Parameters.AddWithValue("@maxmarks", TextBox2.Text);
                comm.Parameters.AddWithValue("@marks", TextBox3.Text);

                comm.ExecuteNonQuery();
                Response.Redirect("ShowResult.aspx");
                Response.Write("Marks Updated");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}