using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Transcript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Students_Courses_transcript", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String Stud_id = "" + rdr["student_id"];
                String Studname =""+ rdr["student name"];
                String c_ID = "" + rdr["course_id"];
                String cName = "" + rdr["course name"];
                String examtype = "" + rdr["exam_type"];
                String grade = "" + rdr["grade"];
                String semester = "" + rdr["semester_code"];
                String instName = "" + rdr["instructor name"];
                
                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
                TableCell cell8 = new TableCell();
                

                cell1.Text = Stud_id;
                cell2.Text = Studname;
                cell3.Text = c_ID;
                cell4.Text = cName;
                cell5.Text = examtype;
                cell6.Text = grade;
                cell7.Text = semester;
                cell8.Text = instName;


                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
                row.Cells.Add(cell8);


                TranscriptTable.Rows.Add(row);
            }
        }
    }
}