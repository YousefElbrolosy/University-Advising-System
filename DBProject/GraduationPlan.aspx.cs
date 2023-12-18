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
    public partial class GraduationPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Advisors_Graduation_Plan", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String p_ID = "" + rdr["plan_id"];
                String semester = "" + rdr["semester_code"];
                String semesterCH = "" + rdr["semester_credit_hours"];
                String gradDate = "" + rdr["expected_grad_date"];
                String adv_id = "" + rdr["advisor_id"];
                String adv_Name = "" + rdr["advisor_name"];
                String Stud_id = "" + rdr["student_id"];

                if (gradDate == "")
                    gradDate = "-";
                else
                    gradDate= ((DateTime)rdr["expected_grad_date"]).ToString("dd-MM-yyyy");

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
                
                cell1.Text = p_ID;
                cell2.Text = semester;
                cell3.Text = semesterCH;
                cell4.Text = gradDate;
                cell5.Text = adv_id;
                cell6.Text = adv_Name;
                cell7.Text = Stud_id;
               

                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
               
                GradPlanTable.Rows.Add(row);
            }
        }
    }
}