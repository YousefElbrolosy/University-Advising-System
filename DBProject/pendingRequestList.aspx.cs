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
    public partial class pendingRequestList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT * FROM all_Pending_Requests";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            string empty1 = "";
            string empty2 = "";
            
                //everytime ther is a row to read
            while (reader.Read())
            {

                int request_id = Convert.ToInt32(reader["request_id"]);
                    


                string type = reader["type"].ToString();
                   

                string comment = reader["comment"].ToString();
                    


                string status = reader["status"].ToString();


                    

                    
                if (reader["credit_hours"] == DBNull.Value)
                {
                    empty1 = "-";
                        
                }
                if (reader["course_id"] == DBNull.Value)
                {
                    empty2 = "-";

                }
                string credit_hours = empty1 + reader["credit_hours"];


                string course_id = empty2 + reader["course_id"];






                int student_id = Convert.ToInt32(reader["student_id"]);


                object r = reader["advisor_id"];
                string advisor_id = "-";
                if (r != null && r != "" && r != DBNull.Value)
                {
                    advisor_id = r.ToString();
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



                cell1.Text = request_id.ToString();
                cell2.Text = type;
                cell3.Text = comment;
                cell4.Text = status;
                cell5.Text = credit_hours;
                cell6.Text = course_id;
                cell7.Text = student_id.ToString();
                cell8.Text = advisor_id.ToString();





                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
                row.Cells.Add(cell8);
                    



                Table.Rows.Add(row);
                empty1 = "";
                empty2 = "";

            }
            
           
        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
    }
}