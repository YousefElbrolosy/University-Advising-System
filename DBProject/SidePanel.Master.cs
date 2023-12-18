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
    public partial class SidePanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewActStudents(object sender, EventArgs e)
        {
            Response.Redirect("ActiveStudents.aspx");
        }

        protected void DeleteCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteCourses.aspx");
        }
        protected void AddExam_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMakeupExam.aspx");
        }

        protected void StudPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewPaymentDetails.aspx");
        }
        protected void GradPlan_Click(object sender, EventArgs e)
        {
            Response.Redirect("GraduationPlan.aspx");
        }

        protected void transcript_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transcript.aspx");
        }

        protected void SemCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("SemesterCourses.aspx");
        }

        protected void DeleteSlot_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteNonOfferedCourseSlots.aspx");
        }

        protected void Installments_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssueInstallments.aspx");
        }

        protected void UpdateStudStat_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateStatus.aspx");
        }
        protected void listAllAdvisors(object snder, EventArgs e)
        {

            Response.Redirect("advisorList.aspx");

        }
        protected void listStudentAdvisors(object snder, EventArgs e)
        {

            Response.Redirect("studentAdvisorList.aspx");

        }
        protected void listPendingRequests(object snder, EventArgs e)
        {

            Response.Redirect("pendingRequestList.aspx");

        }
        protected void AdminAddingSemester(object snder, EventArgs e)
        {

            Response.Redirect("addSemester.aspx");

        }
        protected void AdminAddingCourse(object snder, EventArgs e)
        {

            Response.Redirect("addCourse.aspx");

        }
        protected void AdminLinkingInsCrsSlt(object snder, EventArgs e)
        {

            Response.Redirect("linkInstructorCourseSlot.aspx");

        }

        protected void AdminLinkingStudentAdvisor(object snder, EventArgs e)
        {

            Response.Redirect("linkStudentAdvisor.aspx");

        }
        protected void AdminLinkingStudentCourseInstructor(object snder, EventArgs e)
        {

            Response.Redirect("linkStudentCourseInstructor.aspx");

        }
        protected void AdminListInstructorCourse(object snder, EventArgs e)
        {

            Response.Redirect("listInstructorCourse.aspx");

        }
        protected void AdminFetchSemesterCourse(object snder, EventArgs e)
        {

            Response.Redirect("listSemesterCourse.aspx");

        }
        
        protected void Dashboard_Click(object snder, EventArgs e)
        {

            Response.Redirect("Dashboard.aspx");

        } 
        protected void logout(object snder, EventArgs e)
        {

            Response.Redirect("Login.aspx");

        }
    }

}