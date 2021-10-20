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
    public partial class ShowResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((int)HttpContext.Current.Session["IsAdmin"] == 0)
            {
                
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
                int id = (int)HttpContext.Current.Session["Id"];
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand comm = new SqlCommand("select * from Marks where Studentid=@sid", conn);
                comm.Parameters.AddWithValue("@sid", id);
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

        protected void cedit(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            string url = "EditResult.aspx?id=" + Id;
            Response.Redirect(url);
        }

        protected void cdelete(object sender, EventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand comm = new SqlCommand("delete from Marks where Id=@mid", conn);
                comm.Parameters.AddWithValue("@mid", Id);
                comm.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("ShowResult.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
        protected string GetRowProperties()
        {
            if((int)HttpContext.Current.Session["IsAdmin"] == 1)
            {
                return "Visible='False'";
            }
            return "Visible='True'";
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadRecord();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                int id = (int)HttpContext.Current.Session["Id"];
                string sem = DropDownList1.SelectedItem.ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand comm = new SqlCommand("select * from Marks where Sem=@sem and Studentid=@sid", conn);
                comm.Parameters.AddWithValue("@sem", sem);
                comm.Parameters.AddWithValue("@sid", id);
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
    }
}