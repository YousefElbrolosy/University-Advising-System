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
    public partial class UpdateStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtInput.Text, out int result))
            {
                error.InnerHtml = "Please Enter a number";
                comments.InnerText = "";
                return;

            }
            else
                error.InnerHtml = "";
            int studentId = Int32.Parse(txtInput.Text);

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlConnection conn2 = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Procedure_AdminUpdateStudentStatus", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@StudentID", studentId));
            SqlCommand s_ids = new SqlCommand("SELECT student_id FROM student", conn2);
            conn2.Open();
            List<int> stud_ids= new List<int>();
            SqlDataReader rdr=s_ids.ExecuteReader();
            while (rdr.Read())
            {
                stud_ids.Add((int)rdr["student_id"]);
            }
            if(stud_ids.Contains(studentId)){
                conn.Open();
                cmd.ExecuteNonQuery();
                comments.InnerText = "Financial Status Updated Successfully";
            }
            else
                comments.InnerText = "Student ID Does NOT Exist";
        }
    }
}