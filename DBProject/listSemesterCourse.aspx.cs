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
    public partial class listSemesterCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT * FROM Semster_offered_Courses";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            
                //everytime ther is a row to read
            while (reader.Read())
            {
                object r = reader["course_id"];
                string course_id = "-";
                if (r != null && r != "" && r != DBNull.Value)
                {
                    course_id = r.ToString();
                }
                    


                string course = reader["course_name"].ToString();
                   

                string semester_code = reader["semester_code"].ToString();

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                    


                cell1.Text = course_id.ToString();
                cell2.Text = course;
                cell3.Text = semester_code;
                   




                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                    



                SCTable.Rows.Add(row);

            }
            
        }

        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
    }
}