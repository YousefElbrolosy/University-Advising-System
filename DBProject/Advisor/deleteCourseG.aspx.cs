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
    public partial class deleteCourseG : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void deleteFromG(object sender, EventArgs e)
        {
            try
            {
                err.Text = "";
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("Procedures_AdvisorDeleteFromGP", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                int s_id = Convert.ToInt32(studentID.Text);
                int course_id = Convert.ToInt32(c_id.Text);
                string sem_code = semester_code.Text;



                cmd.Parameters.Add(new SqlParameter("@studentID", s_id));
                cmd.Parameters.Add(new SqlParameter("@course_ID", course_id));
                cmd.Parameters.Add(new SqlParameter("@semester_code", sem_code));

                conn.Open();

                cmd.ExecuteNonQuery();
                Response.Redirect("deleteCourseG.aspx");
                conn.Close();
            }
            catch (System.FormatException){
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