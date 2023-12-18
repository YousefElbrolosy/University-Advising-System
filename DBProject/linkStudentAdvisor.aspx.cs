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
    public partial class LinkStudentAdvisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
        protected void adminLink(object sender, EventArgs e)
        {
            try
            {
                string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand addSemProc = new SqlCommand("Procedures_AdminLinkStudentToAdvisor", conn);
                addSemProc.CommandType = CommandType.StoredProcedure;


                int studentId = Int32.Parse(student_id.Text);
                int advisorId = Int32.Parse(advisor_id.Text);


                addSemProc.Parameters.Add(new SqlParameter("@studentID", studentId));
                addSemProc.Parameters.Add(new SqlParameter("@advisorID", advisorId));



                conn.Open();
                addSemProc.ExecuteNonQuery();
                Response.Redirect("linkStudentAdvisor.aspx");
                conn.Close();
            }
            catch (System.FormatException)
            {
                Label error = new Label();
                error.Text = "One or more fields are incorrect.";
                form12.Controls.Add(error);
            }

        }
    }
}