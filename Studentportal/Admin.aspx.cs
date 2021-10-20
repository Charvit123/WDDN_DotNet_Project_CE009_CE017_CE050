using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows.Forms;
using System.Windows;

namespace Studentportal
{
    public partial class Admin : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }

        void LoadRecord()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                SqlCommand comm = new SqlCommand("select * from Student where  Id!=1", conn);
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        protected void add(object sender, EventArgs e)
        {
            Response.Redirect("AddStudent.aspx");
        }

        protected void logout(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void cinfo(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string url = "StudentInfo.aspx?id=" + Id;
            Response.Redirect(url);
        }

        protected void cedit(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string url = "EditStudent.aspx?id=" + Id; 
            Response.Redirect(url);
        }

        protected void cdelete(object sender, EventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand comm = new SqlCommand("delete from Student where Id=@sid", conn);
                comm.Parameters.AddWithValue("@sid", Id);
                comm.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Admin.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Courses.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string sem = DropDownList1.SelectedItem.ToString();
                string course = DropDownList2.SelectedItem.ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand comm = new SqlCommand("select * from Student where Sem=@sem and Course=@course", conn);
                comm.Parameters.AddWithValue("@sem", sem);
                comm.Parameters.AddWithValue("@course", course);
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