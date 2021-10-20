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
    public partial class AddStudent : System.Web.UI.Page
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
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                string checkStudent = "select count(*) from Student where Fullname='"+ TextBox1.Text + "'";
                SqlCommand comm = new SqlCommand(checkStudent, conn);
                int temp = Convert.ToInt32(comm.ExecuteScalar().ToString());
                if(temp == 1)
                {
                    Response.Write("User already exists");
                }
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                string addStudent = "insert into Student (Fullname, Email, Phone, Address, Gender, Course, Degree, Birthdate, Year, Sem) values (@fullname, @email, @phone, @address, @gender, @course, @degree, @birthdate, @year, @sem)";
                SqlCommand comm = new SqlCommand(addStudent, conn);
                string currentYear = DateTime.Now.Year.ToString();
                comm.Parameters.AddWithValue("@fullname", TextBox1.Text);
                comm.Parameters.AddWithValue("@email", TextBox2.Text);
                comm.Parameters.AddWithValue("@phone", TextBox3.Text);
                comm.Parameters.AddWithValue("@address", TextBox4.Text);
                comm.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.ToString());
                comm.Parameters.AddWithValue("@course", DropDownList2.SelectedItem.ToString());
                comm.Parameters.AddWithValue("@degree", DropDownList3.SelectedItem.ToString());
                comm.Parameters.AddWithValue("@birthdate", TextBox5.Text);
                comm.Parameters.AddWithValue("@year", currentYear.ToString());
                comm.Parameters.AddWithValue("@sem", TextBox6.Text);

                comm.ExecuteNonQuery();
                Response.Redirect("Admin.aspx");
                Response.Write("Student Added");
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }
}