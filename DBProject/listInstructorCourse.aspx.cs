using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminUI
{
    public partial class listInstructorCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT * FROM Instructors_AssignedCourses";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            
            //everytime ther is a row to read
            while (reader.Read())
            {

                int instructor_id = Convert.ToInt32(reader["instructor_id"]);
                    


                string instructor = reader["Instructor name"].ToString();
                    

                int course_id = Convert.ToInt32(reader["course_id"]);
                    


                string course = reader["Course name"].ToString();

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();


                cell1.Text = instructor_id.ToString();
                cell2.Text = instructor;
                cell3.Text = course_id.ToString();
                cell4.Text = course;
                



                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                


                ICTable.Rows.Add(row);

            }
            
            
        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }

    }
}