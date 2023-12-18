using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Management;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DBProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["advisor"] != null)
            {
                if (Session["advisor"].ToString() == "Wrong")
                {
                    arej.InnerHtml = "Wrong ID/Password";
                }
                else if (Session["advisor"].ToString() == "Invalid")
                {
                    arej.InnerHtml = "Invalid ID";
                }
                else {
                    asucc.InnerHtml = "You Have Successfully Registered! <br/> Your Advisor ID is " + Session["advisor"].ToString();
                    advisorID.Value = Session["advisor"].ToString();
                }
            }
            if (Session["student"] != null) {
                
                if (Session["student"].ToString() == "Wrong")
                {
                    srej.InnerHtml = "Wrong ID/Password";
                }
                else if (Session["student"].ToString() == "Invalid")
                {
                    srej.InnerHtml = "Invalid ID";
                }
                else {
                    ssucc.InnerHtml = "You Have Successfully Registered! <br/> Your Student ID is " + Session["student"].ToString();
                    studentID.Value = Session["student"].ToString();
                }
            }
            Session["advisor"] = null;
            Session["student"] = null;
        }

        protected void StudentLogin(object sender, EventArgs e)
        {
            if (studentID.Value == "admin" && studentPasswordL.Value == "admin")
            {
                Response.Redirect("Dashboard.aspx");
                return;
            }
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                int id = Int16.Parse(studentID.Value);

                string password = studentPasswordL.Value;

                string query = "SELECT dbo.FN_StudentLogin(@StudentID, @password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", id);
                cmd.Parameters.AddWithValue("@password", password);
                bool result = Convert.ToBoolean(cmd.ExecuteScalar());

                if (result)
                {

                    Session["id"] = id;
                    Response.Redirect("Student/StudentPortal.aspx");
                }
                else
                {
                    Session["student"] = "Wrong";
                    Response.Redirect("Login.aspx");
                }
            }
            catch (FormatException)
            {
                Session["student"] = "Invalid";
                Response.Redirect("Login.aspx");
            }
        }
        protected void StudentRegister(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string fname = StudentFirstName.Value;
            string lname = StudentLastName.Value;
            string email = StudentEmail.Value;
            string password = StudentPassword.Value;
            string major = Major.Value;
            string faculty = Faculty.Value;
            string semester = Semester.Value;
            string phone = Phone.Value;
            SqlCommand cmd = new SqlCommand("Procedures_StudentRegistration", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@first_name", fname));
            cmd.Parameters.Add(new SqlParameter("@last_name", lname));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@faculty", faculty));
            cmd.Parameters.Add(new SqlParameter("@major", major));
            cmd.Parameters.Add(new SqlParameter("@Semester", semester));

            SqlParameter id = cmd.Parameters.Add("@StudentID", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;
 
            cmd.ExecuteNonQuery();

            studentID.Value = id.Value.ToString();
            Session["student"] =  id.Value.ToString();
            Response.Redirect("Login.aspx");
            SqlCommand cmd2 = new SqlCommand("Procedures_StudentaddMobile", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add(new SqlParameter("@StudentID", Int16.Parse(id.Value.ToString())));
            cmd2.Parameters.Add(new SqlParameter("@mobile_number", phone));

            cmd2.ExecuteNonQuery();

            conn.Close();
        }
        protected void AdvisorLogin(object sender, EventArgs e) {
            if(advisorID.Value == "admin" && advisorPasswordL.Value == "admin")
            {
                Response.Redirect("Dashboard.aspx");
                return;
            }
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            try
            {
                int id = Int16.Parse(advisorID.Value);

                string password = advisorPasswordL.Value;

                string query = "SELECT dbo.FN_AdvisorLogin(@ID, @password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@password", password);
                bool result = Convert.ToBoolean(cmd.ExecuteScalar());

                if (result)
                {

                    Session["id"] = id;
                    Response.Redirect("Advisor/DashboardStudent.aspx");
                }
                else
                {
                    Session["advisor"] = "Wrong";
                    Response.Redirect("Login.aspx");   
                }
            }
            catch (FormatException)
            {
                Session["advisor"] = "Invalid";
                Response.Redirect("Login.aspx");
            }
            conn.Close();
    }


    
        protected void AdvisorRegister(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string name = AdvisorName.Value;
            string office = Office.Value;
            string email = AdvisorEmail.Value;
            string password = AdvisorPassword.Value;
            SqlCommand cmd = new SqlCommand("Procedures_AdvisorRegistration", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@advisor_name",name));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@office", office));

            SqlParameter id = cmd.Parameters.Add("@advisor_id",SqlDbType.Int);
            id.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close() ;
            Session["advisor"] = id.Value.ToString();
            Response.Redirect("Login.aspx");
        }

    }
}