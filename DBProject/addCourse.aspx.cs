using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminUI
{
    public partial class addCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void adminAddCourse(object sender, EventArgs e)
        {
            try
            {
                string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand addCrsProc = new SqlCommand("Procedures_AdminAddingCourse", conn);
                addCrsProc.CommandType = CommandType.StoredProcedure;

                //Input: major varchar (40), semester int, credit hours int, 
                //course name varchar(40), and offered bit


                string major = course_major.Text;
                int sem = Int32.Parse(semester.Text);
                int creditHours = Int32.Parse(credit_hours.Text);
                string courseName = course_name.Text;

                int isOffered = 0;
                if (RadioButtonYes.Checked == true)
                {
                    isOffered = 1;
                }
                else if (RadioButtonNo.Checked == true)
                {
                    isOffered = 0;
                }




                addCrsProc.Parameters.Add(new SqlParameter("@major", major));
                addCrsProc.Parameters.Add(new SqlParameter("@semester", sem));
                addCrsProc.Parameters.Add(new SqlParameter("@credit_hours", creditHours));
                addCrsProc.Parameters.Add(new SqlParameter("@course_name", courseName));
                addCrsProc.Parameters.Add(new SqlParameter("@offered", isOffered));



                conn.Open();
                addCrsProc.ExecuteNonQuery();
                Response.Redirect("addCourse.aspx");
                conn.Close();
            }
            catch (System.FormatException)
            {
                Label error = new Label();
                error.Text = "One or more fields are incorrect.";
                form1.Controls.Add(error);
            }
        }

        

        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
    }
}