using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProject
{
    public partial class StudentPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select dbo.FN_StudentUpcoming_installment(@StudentID)", conn);
            conn.Open();
            int id = Int16.Parse(Session["id"].ToString());
            SqlCommand cmd1 = new SqlCommand("SELECT f_name FROM Student Where student_id ="+id, conn);
            string name = cmd1.ExecuteScalar().ToString();
            if(!IsPostBack)
                hello.InnerHtml += " " + name;
            cmd.Parameters.Add(new SqlParameter("@StudentID", id));
            Object result = cmd.ExecuteScalar();

            if (result == null || result == "" || result == DBNull.Value )
            {
                install.InnerHtml = "No Upcoming Installment";
            }
            else
            {
                string result1 = ((DateTime)result).ToString("dd-MM-yyyy");
                install.InnerText = "Next deadline is on : " + result1.ToString();
            }
            if (!IsPostBack)
            {
                LoadSelect(sender,e);
            }

        }
        protected void SubmitRequest(object sender, EventArgs e)
        {
            if (credit.Checked)
            {
                string value = optionsdropdown.SelectedValue;
                string com = comment.Value;
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                int id = Int16.Parse(Session["id"].ToString());
                string type = "credit_hours";
                conn.Open();
                SqlCommand cmd = new SqlCommand("Procedures_StudentSendingCHRequest", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Student_ID", id));
                cmd.Parameters.Add(new SqlParameter("@credit_hours", value));
                cmd.Parameters.Add(new SqlParameter("@type", type));
                cmd.Parameters.Add(new SqlParameter("@comment", com));
                cmd.ExecuteNonQuery();
            }
            else
            {
                string value = optionsdropdown.SelectedValue;
                string com = comment.Value;
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                int id = Int16.Parse(Session["id"].ToString());
                string type = "course";
                conn.Open();
                SqlCommand cmd = new SqlCommand("Procedures_StudentSendingCourseRequest", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Student_ID", id));
                cmd.Parameters.Add(new SqlParameter("@course_ID", value));
                cmd.Parameters.Add(new SqlParameter("@type", type));
                cmd.Parameters.Add(new SqlParameter("@comment", com));
                cmd.ExecuteNonQuery();
            }
            Label1.Text = "Submitted Request";
        }
        protected void SubmitPhone(object sender, EventArgs e)
        {   
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(Session["id"].ToString());
            conn.Open();
            string pattern = @"^01[0125][0-9]{8}$";
            string phone1 = phone2.Value;
            try
            {
                if (Regex.IsMatch(phone1, pattern))
                {
                    phonestatus.Text = "Successfully Added Phone Number";
                    SqlCommand cmd = new SqlCommand("Procedures_StudentaddMobile", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@StudentID", id));
                    cmd.Parameters.Add(new SqlParameter("@mobile_number", phone1));
                    cmd.ExecuteNonQuery();
                    conn.Close();

                }
                else
                {
                    phonestatus.Text = "Invalid Phone Number";
                }
            }
            catch (Exception)
            {
                phonestatus.Text = "Already used Phone Number";
            }

        }
        protected void LoadSelect(object sender, EventArgs e)
        {
            optionsdropdown.Items.Clear();
            Label1.Text = "";
            if (credit.Checked)
            {
                optionsdropdown.Items.Add(new ListItem("1 Credit Hour", "1"));
                optionsdropdown.Items.Add(new ListItem("2 Credit Hours", "2"));
                optionsdropdown.Items.Add(new ListItem("3 Credit Hours", "3"));
            }
            else
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                int id = Int16.Parse(Session["id"].ToString());
                conn.Open();
                SqlCommand cmd1 = new SqlCommand("SELECT semester_code FROM Semester Where CURRENT_TIMESTAMP Between start_date AND end_date", conn);
                String semester = cmd1.ExecuteScalar().ToString();
                SqlCommand cmd = new SqlCommand("Select c.name,c.course_id From Course c inner join Course_Semester cs on c.course_id = cs.course_id where cs.semester_code = \'" + semester +"\'", conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    optionsdropdown.Items.Add(new ListItem("" + rdr["name"], "" + rdr["course_id"]));
                }
            }
        }
    }
}