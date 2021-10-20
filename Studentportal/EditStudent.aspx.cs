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
    public partial class EditStudent : System.Web.UI.Page
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
                    string getStudent = "select Fullname, Email, Phone, Address, Gender, Course, Degree, Birthdate, Sem from Student where Id=@sid";
                    SqlCommand comm = new SqlCommand(getStudent, conn);
                    comm.Parameters.AddWithValue("@sid", Id);
                    comm.ExecuteNonQuery();
                    SqlDataReader dr = comm.ExecuteReader();
                    if (dr.Read())
                    {
                        TextBoxID.Text = Id.ToString();
                        TextBox1.Text += dr["Fullname"].ToString();
                        TextBox2.Text += dr["Email"].ToString();
                        TextBox3.Text += dr["Phone"].ToString();
                        TextBox4.Text += dr["Address"].ToString();
                        DropDownList1.SelectedItem.Value += dr["Gender"].ToString();
                        DropDownList2.SelectedItem.Value += dr["Course"].ToString();
                        DropDownList3.SelectedItem.Value += dr["Degree"].ToString();
                        TextBox5.Text += dr["Birthdate"].ToString();
                        TextBox6.Text += dr["Sem"].ToString();
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
                string editStudent = "update Student set Fullname=@fullname, Email=@email, Phone=@phone, Address=@address, Gender=@gender, Course=@course, Degree=@degree, Birthdate=@birthdate, Sem=@sem where Id='" + TextBoxID.Text + "'";
                SqlCommand comm = new SqlCommand(editStudent, conn);
                comm.Parameters.AddWithValue("@fullname", TextBox1.Text);
                comm.Parameters.AddWithValue("@email", TextBox2.Text);
                comm.Parameters.AddWithValue("@phone", TextBox3.Text);
                comm.Parameters.AddWithValue("@address", TextBox4.Text);
                comm.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.ToString());
                comm.Parameters.AddWithValue("@course", DropDownList2.SelectedItem.ToString());
                comm.Parameters.AddWithValue("@degree", DropDownList3.SelectedItem.ToString());
                comm.Parameters.AddWithValue("@birthdate", TextBox5.Text);
                comm.Parameters.AddWithValue("@sem", TextBox6.Text);

                comm.ExecuteNonQuery();
                Response.Redirect("Admin.aspx");
                Response.Write("Student Updated");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}