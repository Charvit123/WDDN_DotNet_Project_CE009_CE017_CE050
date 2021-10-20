using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace Studentportal
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        StringBuilder htmlTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if((int)HttpContext.Current.Session["IsAdmin"] == 1)
            {
                LinkButton2.Visible = true;
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
                    SqlCommand comm = new SqlCommand("select  Id,Fullname, Email, Phone, Address, Gender, Course, Degree, Birthdate, Year, Sem from Student where Id=@sid", conn);
                    conn.Open();
                    comm.Parameters.AddWithValue("@sid", Id);
                    comm.ExecuteNonQuery();
                    SqlDataReader dr = comm.ExecuteReader();

                    if (dr.Read())
                    {
                        Session["Sem"] = Convert.ToInt32(dr["Sem"].ToString());
                        Session["Id"] = Convert.ToInt32(dr["Id"].ToString());
                        Session["Branch"] = dr["Course"].ToString();
                        htmlTable.Append("<table>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Fullname: </td>");
                        htmlTable.Append("<td>" + dr["Fullname"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Email Address: </td>");
                        htmlTable.Append("<td>" + dr["Email"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Phone No: </td>");
                        htmlTable.Append("<td>" + dr["Phone"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Address: </td>");
                        htmlTable.Append("<td>" + dr["Address"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Gender: </td>");
                        htmlTable.Append("<td>" + dr["Gender"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Course: </td>");
                        htmlTable.Append("<td>" + dr["Course"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Degree: </td>");
                        htmlTable.Append("<td>" + dr["degree"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>BirthDate: </td>");
                        htmlTable.Append("<td>" + dr["Birthdate"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Year: </td>");
                        htmlTable.Append("<td>" + dr["Year"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("<tr>");
                        htmlTable.Append("<td>Sem: </td>");
                        htmlTable.Append("<td>" + dr["Sem"].ToString() + "</td>");
                        htmlTable.Append("</tr>");

                        htmlTable.Append("</table>");
                        DBDataPlaceHolder.Controls.Add(new Literal { Text = htmlTable.ToString() });
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.ToString());
                }
            }
        }

        protected void mycourses(object sender, EventArgs e)
        {
            //int sem = Convert.ToInt32((sender as LinkButton).CommandArgument);
            //System.Diagnostics.Debug.WriteLine(sem);
            string url = "MyCourses.aspx";
            Response.Redirect(url);
        }

        protected void logout(object sender, EventArgs e)
        {
            HttpContext.Current.Session["IsLogin"] = 0;
            HttpContext.Current.Session["IsAdmin"] = 0;
            Response.Redirect("Login.aspx");
        }

        protected void admin(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddResult.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowResult.aspx");
        }
    }
}