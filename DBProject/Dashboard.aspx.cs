using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pendingRequests();
            currentSemester();
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

        public string advisorCount()
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT Count(*) As 'count' FROM Advisor";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            string count = "";
            if (reader.HasRows)
            {
                //everytime ther is a row to read
                while (reader.Read())
                {
                    count = reader["count"].ToString();
                    
                }
            }
            return count;
        }

        public string studentCount()
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT Count(*) As 'count' FROM Student";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            string count = "";
            if (reader.HasRows)
            {
                //everytime ther is a row to read
                while (reader.Read())
                {
                    count = reader["count"].ToString();

                }
            }
            return count;
        }

        public int creditCount()
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT Count(*) As 'count' FROM all_pending_requests WHERE type='credit_hours'";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            int count = 0;
            if (reader.HasRows)
            {
                //everytime ther is a row to read
                while (reader.Read())
                {
                    count = Convert.ToInt32(reader["count"]);

                }
            }
            return count;
        }
        public int courseCount()
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT Count(*) As 'count' FROM all_pending_requests WHERE type='course'";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            int count = 0;
            if (reader.HasRows)
            {
                //everytime ther is a row to read
                while (reader.Read())
                {
                    count = Convert.ToInt32(reader["count"]);

                }
            }
            return count;
        }

        protected void pendingRequests()
        {
           
            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string sqlQuery = "SELECT Count(*) As 'count' FROM all_Pending_Requests";
            SqlCommand listadvproc = new SqlCommand(sqlQuery, conn);
            conn.Open();
            SqlDataReader reader = listadvproc.ExecuteReader();
            if (reader.HasRows)
            {
                //everytime ther is a row to read
                while (reader.Read())
                {

                    pendingRequestsLable.Text = reader["count"].ToString();
                }
            }
            
        }
        protected void currentSemester()
        {

            DateTime currentDateTime = DateTime.Now;
            
            string letter = "";
            string letter1 = "";
            char year1 = currentDateTime.Year.ToString()[2];
            char year2 = currentDateTime.Year.ToString()[3];
            if (currentDateTime.Month == 9 || currentDateTime.Month == 10 || currentDateTime.Month == 11 || currentDateTime.Month == 12 || currentDateTime.Month == 1)
            {
                letter = "W";
            }
            else if(currentDateTime.Month == 2 || currentDateTime.Month == 3|| currentDateTime.Month == 4 || currentDateTime.Month == 5 || currentDateTime.Month == 6 || (currentDateTime.Month == 7 && currentDateTime.Day < 15))
            {
                letter = "S";
            }
            else if((currentDateTime.Month == 7 && currentDateTime.Day > 15) || (currentDateTime.Month == 8 && currentDateTime.Day < 15)) {
                letter = "S";
                letter1 = "R1";
            }
            else if ((currentDateTime.Month == 8 && currentDateTime.Day > 15) || (currentDateTime.Month == 9 && currentDateTime.Day < 15))
            {
                letter = "S";
                letter1 = "R2";
            }

            string output = letter+year1+year2+letter1;
            currentSemesterLable.Text = output;


        }


    }

}