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
    public partial class DashboardStudent: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NextInstallment();
            currentSemester();
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

        

        protected void NextInstallment()
        {

            string conStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            string id = Session["id"].ToString();
            string query = "SELECT Count(*) As count FROM Student where advisor_id = "+ id;
            SqlCommand cmd = new SqlCommand(query, conn);
            string str = "";
            conn.Open();
            
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                str = "" + rdr["count"];
                pendingRequestsLable.Text = "" + str;
            }
            
            conn.Close();

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
            else if (currentDateTime.Month == 2 || currentDateTime.Month == 3 || currentDateTime.Month == 4 || currentDateTime.Month == 5 || currentDateTime.Month == 6 || (currentDateTime.Month == 7 && currentDateTime.Day < 15))
            {
                letter = "S";
            }
            else if ((currentDateTime.Month == 7 && currentDateTime.Day > 15) || (currentDateTime.Month == 8 && currentDateTime.Day < 15))
            {
                letter = "S";
                letter1 = "R1";
            }
            else if ((currentDateTime.Month == 8 && currentDateTime.Day > 15) || (currentDateTime.Month == 9 && currentDateTime.Day < 15))
            {
                letter = "S";
                letter1 = "R2";
            }

            string output = letter + year1 + year2 + letter1;
            currentSemesterLable.Text = output;


        }



    }
}