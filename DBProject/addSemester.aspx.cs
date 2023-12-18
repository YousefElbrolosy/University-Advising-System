using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminUI
{
    public partial class addSemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Response.Redirect("AdminPortal.aspx");
        }
        protected void adminAdd(object sender, EventArgs e)
        {
             
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand addSemProc = new SqlCommand("AdminAddingSemester", conn);
            addSemProc.CommandType = CommandType.StoredProcedure;
            try
            {
                DateTime startDate = DateTime.Parse(start_date.Text);
                DateTime endDate = DateTime.Parse(end_date.Text);
                string semesterCode = semester_code.Text;
                addSemProc.Parameters.Add(new SqlParameter("@start_date", startDate));
                addSemProc.Parameters.Add(new SqlParameter("@end_date", endDate));
                addSemProc.Parameters.Add(new SqlParameter("@semester_code", semesterCode));
                conn.Open();
                addSemProc.ExecuteNonQuery();
                Response.Redirect("addSemester.aspx");
                conn.Close();
            }
            catch (System.FormatException)
            {
                Label error = new Label();
                error.Text = "One or more fields are incorrect";
                form1.Controls.Add(error);
            }
            
            


            
            
        }
    }
}