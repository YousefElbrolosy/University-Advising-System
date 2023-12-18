using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void goToMC(object sender, EventArgs e)
        {
            Response.Redirect("MissingCourses.aspx");
        }
        protected void goToAC(object sender, EventArgs e)
        {
            Response.Redirect("AvailableCourses.aspx");
        }
        protected void goToOC(object sender, EventArgs e)
        {
            Response.Redirect("OptionalCourses.aspx");
        }
        protected void goToRC(object sender, EventArgs e)
        {
            Response.Redirect("RequiredCourses.aspx");
        }
        protected void goToPre(object sender, EventArgs e)
        {
            Response.Redirect("precourses.aspx", true);
        }
        protected void goToED(object sender, EventArgs e)
        {
            Response.Redirect("viewExams.aspx", true);
        }
        protected void goToCSI(object sender, EventArgs e)
        {
            Response.Redirect("viewCSI.aspx", true);
        }
        protected void goToGrad(object sender, EventArgs e)
        {
            Response.Redirect("GraduationPlan.aspx", true);
        }
        protected void goToICS(object sender, EventArgs e)
        {
            Response.Redirect("studentViewSlots.aspx", true);
        }
        protected void goToFM(object sender, EventArgs e)
        {
            Response.Redirect("Register_FM.aspx", true);

        } 
        protected void goToSM(object sender, EventArgs e)
        {
            Response.Redirect("Register_SecondMakeup.aspx", true);
        }
        protected void goToDB(object sender, EventArgs e)
        {
            Response.Redirect("StudentPortal.aspx", true);
        }
        protected void goToCIC(object sender, EventArgs e)
        {
            Response.Redirect("chooseInstructor_for_course.aspx", true);
        } 
        protected void goToLP(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }
    }
}