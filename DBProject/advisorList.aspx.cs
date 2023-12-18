using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace AdminUI
{
    public partial class adminList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand listadvproc = new SqlCommand("Procedures_AdminListAdvisors", conn);
            listadvproc.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
           
            //everytime ther is a row to read
            while (reader.Read())
            {
                object r = reader["advisor_id"];
                string advisor_id = "-";
                if (r != DBNull.Value)
                {
                     advisor_id = r.ToString();
                }      
                string advisor_name = reader["name"].ToString();
                    

                string email = reader["email"].ToString();
                    


                string office = reader["office"].ToString();
                    


                string password = reader["password"].ToString();

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();


                cell1.Text = advisor_id.ToString();
                cell2.Text = advisor_name;
                cell3.Text = email;
                cell4.Text = office;
                cell5.Text = password;



                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);


                advisorTable.Rows.Add(row);
                }
            
           
        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
    }

}
