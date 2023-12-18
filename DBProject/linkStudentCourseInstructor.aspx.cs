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
    public partial class linkStudentCourseInstructor : System.Web.UI.Page
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
                SqlCommand addSemProc = new SqlCommand("Procedures_AdminLinkStudent", conn);
                addSemProc.CommandType = CommandType.StoredProcedure;


                int instructorID = Int32.Parse(instructor_id.Text);
                int courseID = Int32.Parse(course_id.Text);
                int studentID = Int32.Parse(student_id.Text);
                string semesterCode = semester_code.Text;

                addSemProc.Parameters.Add(new SqlParameter("@instructor_id", instructorID));
                addSemProc.Parameters.Add(new SqlParameter("@course_id", courseID));
                addSemProc.Parameters.Add(new SqlParameter("@student_id", studentID));
                addSemProc.Parameters.Add(new SqlParameter("@semester_code", semesterCode));


                conn.Open();
                addSemProc.ExecuteNonQuery();
                Response.Redirect("linkStudentCourseInstructor.aspx");
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