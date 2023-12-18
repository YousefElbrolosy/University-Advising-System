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
    public partial class linkInstructorCourseSlot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void adminLink(object sender, EventArgs e)
        {
            try
            {
                string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand addSemProc = new SqlCommand("Procedures_AdminLinkInstructor", conn);
                addSemProc.CommandType = CommandType.StoredProcedure;


                int instructorID = Int32.Parse(instructor_id.Text);
                int courseID = Int32.Parse(course_id.Text);
                int slotID = Int32.Parse(slot_id.Text);

                addSemProc.Parameters.Add(new SqlParameter("@InstructorId", instructorID));
                addSemProc.Parameters.Add(new SqlParameter("@courseId", courseID));
                addSemProc.Parameters.Add(new SqlParameter("@slotID", slotID));


                conn.Open();
                addSemProc.ExecuteNonQuery();
                Response.Redirect("linkInstructorCourseSlot.aspx");
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