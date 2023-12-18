using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

namespace trial
{
    public partial class chooseInstructor_for_course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {

                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                int id = Int16.Parse(Session["id"].ToString());
                //bageb el courses el student msglha we m3ndosh instructor leha
                SqlCommand cmd2 = new SqlCommand("select si.course_id,c.name from Student_Instructor_Course_Take si inner Join course c on si.course_id = c.course_id where si.instructor_id is Null and si.student_id = " + id, conn);

                conn.Open();

                SqlDataReader rdr = cmd2.ExecuteReader();
                while (rdr.Read())
                {
                    ddl.Items.Add(new ListItem("" + rdr["name"], "" + rdr["course_id"]));
                }

            }
        }

        protected void loadInstructors(object sender, EventArgs e)
        {
            ddl2.Items.Clear();
            ddl2.Items.Add(new ListItem("Select Instructor", "-1"));
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
           
            int courseid = Int32.Parse(ddl.SelectedValue);
            //bageb el courses el instructors ll course elly m5taro
            SqlCommand cmd2 = new SqlCommand("select i.name,ic.instructor_id from Instructor i inner Join Instructor_Course ic on i.instructor_id=ic.instructor_id where ic.course_id =" +courseid, conn);
           
            conn.Open();

            SqlDataReader rdr = cmd2.ExecuteReader();
            while (rdr.Read())
            {
                ddl2.Items.Add(new ListItem("" + rdr["name"], "" + rdr["instructor_id"]));
            }

        }

        protected void Confirm(object sender, EventArgs e)
        {
            if (ddl.SelectedValue == "-1" || ddl2.SelectedValue == "-1")
            {
                status2.InnerHtml = "Please select a Course/Instructor";
                status1.InnerHtml = "";
            }
            else
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand cmd1 = new SqlCommand("SELECT semester_code FROM Semester Where CURRENT_TIMESTAMP Between start_date AND end_date", conn);
                String semester = cmd1.ExecuteScalar().ToString();
                int courseid = Int32.Parse(ddl.SelectedValue);
                int instructorid = Int32.Parse(ddl2.SelectedValue);
                int id = Int16.Parse(Session["id"].ToString());
                SqlCommand cmd = new SqlCommand("Procedures_ChooseInstructor", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Student_ID", id));
                cmd.Parameters.Add(new SqlParameter("@Course_ID", courseid));
                cmd.Parameters.Add(new SqlParameter("@semesterCode", semester));
                cmd.Parameters.Add(new SqlParameter("@Instructor_ID", instructorid));
                cmd.ExecuteNonQuery();
                status1.InnerHtml = "Instructor Chosen Succesfully";
                status2.InnerHtml = "";
            }



        }
    }
}