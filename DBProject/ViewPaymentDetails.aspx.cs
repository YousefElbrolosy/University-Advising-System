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
    public partial class ViewPaymentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Student_Payment", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String p_ID = "" + rdr["payment_id"];
                String amount = "" + rdr["amount"]+" EGP";
                String ddline = "" + rdr["deadline"];
                String ninstall = "" + rdr["n_installments"];
                String semester = "" + rdr["semester_code"];
                String status = "" + rdr["status"];
                String fund = "" + rdr["fund_percentage"]+"%";
                String startDate = "" + rdr["start_date"];
                String Stud_id = "" + rdr["student_id"];
                String Studname = rdr["f_name"] + " " + rdr["l_name"];

                if (startDate == "")
                    startDate = "-";
                else
                    startDate = ((DateTime)rdr["start_date"]).ToString("dd-MM-yyyy");
                if (ddline == "")
                    ddline = "-";
                else
                    ddline = ((DateTime)rdr["deadline"]).ToString("dd-MM-yyyy");

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
                
                cell1.Text = p_ID;
                cell2.Text = amount;
                cell3.Text = ddline;
                cell4.Text = ninstall;
                cell5.Text = status;
                cell6.Text = fund;
                cell7.Text = startDate;
                cell8.Text = semester;
                cell9.Text =Stud_id;
                cell10.Text = Studname;
               

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


                PaymentDetailsTable.Rows.Add(row);
            }
        }
    }
}