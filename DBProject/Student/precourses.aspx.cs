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
    public partial class precourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from view_Course_prerequisites", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while(rdr.Read())
            {

                String coursid = ""+ rdr["course_id"];
                String Studentname = "" + rdr["name"];
                String major = "" + rdr["major"];
                String is_offered = "" + rdr["is_offered"];
                String credithours = ""+ rdr["credit_hours"];
                String Semester = ""+ rdr["semester"];
                String precourseID = "" + rdr["prerequisite_course_id"];
                String precoursename = "" + rdr["Prerequisite course name "];
                if (precoursename == "")
                {
                    precoursename = "-";
                }
                if (precourseID == "")
                {
                    precourseID = "-";
                }
                if (Semester == "")
                {
                    Semester = "-";
                }
                if (credithours == "")
                {
                    credithours = "-";
                }
                if (is_offered == "")
                {
                    is_offered = "-";
                }
                if (major == "")
                {
                    major = "-";
                }
                if (Studentname == "")
                {
                    Studentname = "-";
                }
                if (coursid == "")
                {
                    coursid = "-";
                }
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
                TableCell cell8 = new TableCell();
                cell1.Text = coursid;
                cell2.Text = Studentname;
                cell3.Text = major;
                cell4.Text = is_offered;
                cell5.Text = credithours;
                cell6.Text = Semester;
                cell7.Text = precourseID;
                cell8.Text = precoursename;


                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
                row.Cells.Add(cell8);
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