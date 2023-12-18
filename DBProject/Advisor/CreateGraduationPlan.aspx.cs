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
    public partial class CreateGraduationPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateDropDown();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Semddl.SelectedValue == "-1")
            {
                e1.InnerHtml = "Please specify a semester";
                examresp.InnerText = "";

            }
            else
                e1.InnerHtml = "";
      
            DateTime enteredDate;
            if (!DateTime.TryParse(txtInput.Text, out enteredDate))
            {
                e3.InnerHtml = "Invalid date";
                examresp.InnerText = "";

            }
            else
                e3.InnerHtml = "";

            if (Studtextbox.Text == "Enter Student ID:")
            {
                e2.InnerHtml = "Please specify a Student ID";
                examresp.InnerText = "";
            }
            else
                e2.InnerHtml = "";
            if (SemCH.Text== "Semester Credit Hours:")
            {
                e4.InnerHtml = "Please Specify Hours";
                examresp.InnerText = "";

            }
            else
                e4.InnerHtml = "";


            if (Semddl.SelectedValue == "-1" || Studtextbox.Text=="" || !DateTime.TryParse(txtInput.Text, out enteredDate) || Studtextbox.Text== "Enter Student ID:" || SemCH.Text== "Semester Credit Hours:")
                return;

            int studentId =Int32.Parse(Studtextbox.Text);
            int advisorid = Int16.Parse(Session["id"].ToString());
            //int advisorid=2;
            String semcode = Semddl.SelectedValue;
            String expectedGrad= txtInput.Text;
            String semch= SemCH.Text;

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();

            SqlConnection conn2 = new SqlConnection(connStr);
            SqlCommand s_ids = new SqlCommand("Select student_id from Student", conn2);
            conn2.Open();
            List<int> stud_ids = new List<int>();
            SqlDataReader rdr = s_ids.ExecuteReader();
            while (rdr.Read())
            {
                stud_ids.Add((int)rdr["student_id"]);
            }
            if (stud_ids.Contains(studentId))
            {

                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("Procedures_AdvisorCreateGP", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@student_id", studentId));
                cmd.Parameters.Add(new SqlParameter("@advisor_id", advisorid));
                cmd.Parameters.Add(new SqlParameter("@expected_graduation_date", expectedGrad));
                cmd.Parameters.Add(new SqlParameter("@Semester_code", semcode));
                cmd.Parameters.Add(new SqlParameter("@sem_credit_hours", semch));
                conn.Open();
                cmd.ExecuteNonQuery();
                SqlConnection conn3 = new SqlConnection(connStr);
                SqlCommand gradplan_id = new SqlCommand("Select plan_id from Graduation_Plan WHERE student_id=@student_id AND advisor_id=@advisor_id AND expected_grad_date=@expected_graduation_date AND semester_code=@Semester_code AND semester_credit_hours=@sem_credit_hours  ", conn3);
                conn3.Open();
                gradplan_id.Parameters.Add(new SqlParameter("@student_id", studentId));
                gradplan_id.Parameters.Add(new SqlParameter("@advisor_id", advisorid));
                gradplan_id.Parameters.Add(new SqlParameter("@expected_graduation_date", expectedGrad));
                gradplan_id.Parameters.Add(new SqlParameter("@Semester_code", semcode));
                gradplan_id.Parameters.Add(new SqlParameter("@sem_credit_hours", semch));
                Object a=gradplan_id.ExecuteScalar();
                if (a==null)
                    examresp.InnerText = "Student has less than 157 acquired hours";

                else
                    examresp.InnerText = "Graduation Plan Successfully added";
            }
            else
                examresp.InnerText = "Student ID doesn't Exist";


        }

        public void populateDropDown()
        {
            if (Semddl.SelectedValue == "-1")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("SELECT semester_code FROM Semester", conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Semddl.Items.Add(new ListItem(rdr["semester_code"].ToString(), "" + rdr["semester_code"]));
                }
            }
        }
    }
}