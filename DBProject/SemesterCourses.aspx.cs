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
    public partial class SemesterCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Semster_offered_Courses", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String c_ID = "" + rdr["course_id"];
                String cName = "" + rdr["course_name"];
                String semester = "" + rdr["semester_code"];

                if (c_ID == "")
                    c_ID = "-";
                if (cName == "")
                    cName = "-";

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
              
                cell1.Text = semester;
                cell2.Text = c_ID;
                cell3.Text = cName;

                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);

                TranscriptTable.Rows.Add(row);
            }
        }
    }
}