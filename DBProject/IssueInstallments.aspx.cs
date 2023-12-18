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
    public partial class IssueInstallments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
             try
             {
            if (!int.TryParse(txtInput.Text, out int result))
                {
                    error.InnerHtml = "Please Enter a number";
                    comments.InnerText = "";
                    return;

                }
                else
                    error.InnerHtml = "";
                int paymentId = Int32.Parse(txtInput.Text);
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlConnection conn2 = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("Procedures_AdminIssueInstallment", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@payment_ID", paymentId));
                SqlCommand payment_ids = new SqlCommand("SELECT payment_id FROM payment", conn2);
                conn2.Open();
                SqlDataReader rdr = payment_ids.ExecuteReader();
                List<Int32> p_ids = new List<Int32>();
                while (rdr.Read())
                {
                    p_ids.Add((int)rdr["payment_id"]);
                }
                if (p_ids.Contains(paymentId))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    comments.InnerText = "Installments Issued Successfully";
                }
                else
                    comments.InnerText = "Payment ID Does NOT Exist";

            }
            catch
            {
                comments.InnerText = "Installments have already been issued before";
            }



        }
    }
}