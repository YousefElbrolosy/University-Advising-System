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
    public partial class updateGradDate : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void updateGradPlan(object sender, EventArgs e)
        {
            try
            {
                err.Text = "";
                string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand cmd = new SqlCommand("Procedures_AdvisorUpdateGP", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                //Input: major varchar (40), semester int, credit hours int, 
                //course name varchar(40), and offered bit


                DateTime grad_date = DateTime.Parse(date.Text);
                int studentID = Convert.ToInt32(s_id.Text);







                cmd.Parameters.Add(new SqlParameter("@expected_grad_date", grad_date));
                cmd.Parameters.Add(new SqlParameter("@studentID", studentID));




                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("updateGradDate.aspx");
                conn.Close();
            }
            catch (System.FormatException)
            {
                Label error = new Label();
                err.Text = "One or more fields are empty";
            }
        }



        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorPortal.aspx");
        }
    }
}