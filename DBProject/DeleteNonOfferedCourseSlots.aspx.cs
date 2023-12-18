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
    public partial class DeleteNonOfferedCourseSlots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
            status.InnerHtml = "";
        }
        protected void buttonYes_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand getSem = new SqlCommand("Select semester_code FROM Semester WHERE start_date<CURRENT_TIMESTAMP AND end_date>CURRENT_TIMESTAMP", conn);
            String semester = getSem.ExecuteScalar().ToString();
            SqlCommand cmd = new SqlCommand("Procedures_AdminDeleteSlots", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@current_Semester", semester));
            cmd.ExecuteNonQuery();
            status.InnerHtml = "Slots Deleted Successfully";
        }
    }
}