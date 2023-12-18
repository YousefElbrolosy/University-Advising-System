using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ActiveStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from view_Students",conn);
            conn.Open();
            SqlDataReader rdr= cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while(rdr.Read())
            {
                String Stud_id = "" + rdr["student_id"];
                String Studname = rdr["f_name"] + " " + rdr["l_name"];
                String gpa = "" + rdr["gpa"];
                String faculty = "" + rdr["faculty"];
                String email = ""+rdr["email"];
                String major = "" + rdr["major"];
                String password =""+ rdr["password"];
                String semester = ""+rdr["semester"];
                String fin = "" + rdr["financial_status"];
                String acqhrs = ""+rdr["acquired_hours"];
                String asshrs = ""+rdr["assigned_hours"];
                String adv_id =""+rdr["advisor_id"];

                if (adv_id == "")
                    adv_id = "-";
                if (Studname =="")
                    Studname = "-";
                if (gpa=="")
                    gpa= "-";
                if (asshrs == "")
                    asshrs = "-";
                if (acqhrs == "")
                    acqhrs = "-"; 

                TableRow row = new TableRow();
                
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell(); 
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell(); 
                TableCell cell7 = new TableCell();
                TableCell cell8 = new TableCell();
                TableCell cell9 = new TableCell(); 
                TableCell cell10 = new TableCell();
                TableCell cell11 = new TableCell();
                TableCell cell12 = new TableCell();

                cell1.Text = Stud_id;
                cell2.Text = Studname;
                cell3.Text = gpa;
                cell4.Text= faculty;
                cell5.Text = email;
                cell6.Text = major;
                cell7.Text = password;
                cell8.Text = fin;
                cell9.Text = semester;
                cell10.Text = acqhrs;
                cell11.Text = asshrs;
                cell12.Text = adv_id;

                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
                row.Cells.Add(cell8);
                row.Cells.Add(cell9);
                row.Cells.Add(cell10);
                row.Cells.Add(cell11);
                row.Cells.Add(cell12);

                myTable.Rows.Add(row);
            }
        }
    }
}