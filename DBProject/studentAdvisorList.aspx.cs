using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace AdminUI
{
    public partial class studentAdvisorList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand listadvproc = new SqlCommand("AdminListStudentsWithAdvisors", conn);
            listadvproc.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            
                //everytime ther is a row to read
                while (reader.Read())
                {
                //Student.student_id, Student.f_name, Student.l_name, Advisor.advisor_id, Advisor.advisor_name
                int student_id = Convert.ToInt32(reader["student_id"]);
                    


                string name = reader["Student Name"].ToString();


                object r = reader["advisor_id"];
                string advisor_id = "-";
                if (r != null && r != "" && r != DBNull.Value)
                {
                    advisor_id = r.ToString();
                }


                string advisor_name = reader["Advisor name"].ToString();

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();



                cell1.Text = student_id.ToString();
                cell2.Text = name;
                cell3.Text = advisor_id.ToString();
                cell4.Text = advisor_name;
                    





                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                   



                Table.Rows.Add(row);



                
            }
         
        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
    }
}