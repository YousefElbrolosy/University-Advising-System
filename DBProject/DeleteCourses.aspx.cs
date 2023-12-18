using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class DeleteCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateDropDown();
        }

        protected void delCourseButton_Click(object sender, EventArgs e)
        {
            if (ddl1.SelectedValue == "-1")
            {
                err.InnerHtml = "No Course Selected";
                status.InnerHtml = "";
                return;
            }
            err.InnerHtml = "";
            int id = Int32.Parse(ddl1.SelectedValue);
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Procedures_AdminDeleteCourse", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@courseID", id));
            conn.Open();

                cmd.ExecuteNonQuery();
                status.InnerHtml = "Course successfully deleted";
                btnRemoveItem_Click("" + id);
           
        }
        public void populateDropDown()
        {
            if (ddl1.SelectedValue == "-1")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("select * from Course", conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ddl1.Items.Add(new ListItem(rdr["name"].ToString(), "" + rdr["course_id"]));
                }
            }
        }
        protected void btnRemoveItem_Click(String value)
        {
            ddl1.Items.Clear();  
            ddl1.Items.Add(new ListItem("Select Course", "-1"));
            populateDropDown();
        }
    }
}