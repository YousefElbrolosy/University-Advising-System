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
    public partial class InsertCoursesGP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateDropDown1();
            populateDropDown2();
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            if (Semddl.SelectedValue == "-1")
            {
                e1.InnerHtml = "Please specify a semester";
                examresp.InnerText = "";

            }
            else
                e1.InnerHtml = "";
            if (Cddl.SelectedValue == "-1")
            {
                e2.InnerHtml = "Please specify a Course";
                examresp.InnerText = "";
            }
            else
                e2.InnerHtml = "";

            if (!int.TryParse(Studtextbox.Text, out int intValue))
            {
                e3.InnerHtml = "Please specify a Student ID";
                examresp.InnerText = "";
            }
            else
                e3.InnerHtml = "";
            

            if (Semddl.SelectedValue == "-1" || Cddl.SelectedValue == "-1" || !int.TryParse(Studtextbox.Text, out int Value) )
                return;

            try
            {
                int studentId = Int32.Parse(Studtextbox.Text);
                String semcode = Semddl.SelectedValue;
                String course = Cddl.SelectedValue;
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("Procedures_AdvisorAddCourseGP", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@student_id", studentId));
                cmd.Parameters.Add(new SqlParameter("@Semester_code", semcode));
                cmd.Parameters.Add(new SqlParameter("@course_name", course));
                conn.Open();
                cmd.ExecuteNonQuery();
                examresp.InnerText = "Course Added Successfully";
            }
            catch
            {
                examresp.InnerText = "This student doesn't have a Graduation Plan in the selected semeseter";
            }

        }

        public void populateDropDown1()
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

        public void populateDropDown2()
        {
            if (Cddl.SelectedValue == "-1")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("select * from Course", conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Cddl.Items.Add(new ListItem(rdr["name"].ToString(), "" + rdr["name"]));
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}