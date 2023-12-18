using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trial
{
    public partial class viewExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Courses_MakeupExams", conn);
            conn.Open();
       
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {

                String coursename = "" + rdr["name"];
                String semester = "" + rdr["semester"];
                String examid = "" + rdr["exam_id"];
                String date = "" + rdr["date"];
                String type = "" + rdr["type"];
                String courseid = "" + rdr["course_id"];
                if (coursename == "")
                {
                    coursename = "-";
                }
                if (semester == "")
                {
                    semester = "-";
                }
                if (examid == "")
                {
                    examid = "-";
                }
                if (date == "")
                {
                    date = "-";
                }
                else
                {
                    date = "" + (Convert.ToDateTime(date)).ToString("dd-MM-yyyy");
                }
                if (type == "")
                {
                    type = "-";
                }
                if (courseid == "")
                {
                    courseid = "-";
                }


                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
               

                cell1.Text = coursename;
                cell2.Text = semester;
                cell3.Text = examid;
                cell4.Text = date;
                cell5.Text = type;
                cell6.Text = courseid;
               
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
               
                myTable.Controls.Add(row);

            }
            if (myTable.Rows.Count == 1)
            {
                lblEmptyMessage.Visible = true;
                myTable.Visible = false;
            }
        }
    }
}