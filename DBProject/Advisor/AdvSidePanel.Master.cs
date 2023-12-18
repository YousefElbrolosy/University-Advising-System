using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.Advisor
{
    public partial class AdvSidePanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateGP_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateGraduationPlan.aspx");
        }
        protected void InsertCrsGP_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertCoursesGP.aspx");
        }
        protected void ViewAdvStud_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_his_her_students2.aspx");
        }
        protected void ViewAdvStudMajor_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_his_her_students.aspx");
        }
        protected void ViewReq_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_All_Requests.aspx");
        }
        protected void Request_Click(object sender, EventArgs e)
        {
            Response.Redirect("PendingRequests.aspx");
        }
        protected void UpdateGradDate(object snder, EventArgs e)
        {

            Response.Redirect("updateGradDate.aspx");

        }
        protected void DeleteCourseG(object snder, EventArgs e)
        {

            Response.Redirect("deleteCourseG.aspx");

        }
        protected void Dashboard(object snder, EventArgs e)
        {

            Response.Redirect("DashboardStudent.aspx");

        }





    }
}