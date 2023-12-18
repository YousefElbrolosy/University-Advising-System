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
    public partial class GraduationPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from dbo.FN_StudentViewGP(@StudentID)", conn);
            conn.Open();
            int id = Int16.Parse(Session["id"].ToString());
            cmd.Parameters.Add(new SqlParameter("@StudentID", id));
            SqlDataReader rdr=cmd.ExecuteReader();

            while (rdr.Read())
            {

                String Studentname =""+ rdr["Student name"];
                String planID = ""+rdr["plan_id"];
                String courseID = "" + rdr["course_id"];
                String courseName = "" + rdr["Course name"];
                String smscode = "" + rdr["semester_code"];
                String expgraddate = "" + rdr["expected_grad_date"];
                String semsCH = "" + rdr["semester_credit_hours"];
                String advisorid =""+ rdr["advisor_id"];

                
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
                TableCell cell8 = new TableCell();

                cell1.Text = Studentname        ;
                cell2.Text = planID;
                cell3.Text = courseID;
                cell4.Text = courseName;
                cell5.Text = smscode;
                cell6.Text = expgraddate;
                cell7.Text = semsCH;
                cell8.Text = advisorid;
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