using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trial
{
    public partial class Register_FM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                load();
            }

        }
        protected void load()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(Session["id"].ToString());
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT semester_code FROM Semester Where CURRENT_TIMESTAMP Between start_date AND end_date", conn);
            String semester = cmd1.ExecuteScalar().ToString();
            SqlCommand cmd2 = new SqlCommand("Select distinct c.course_id , c.name from Student_Instructor_Course_Take sct Inner JOIN course c on sct.course_id=c.course_id where (sct.grade IN ('F','FF') OR sct.grade IS NUll) AND student_id = " + id + " AND sct.semester_code <> \'" + semester + "\'", conn);
            //Incase if there is no exam
            //SqlCommand cmd2 = new SqlCommand("Select distinct c.course_id , c.name from Student_Instructor_Course_Take sct Inner JOIN course c on sct.course_id=c.course_id Inner Join MakeUp_Exam me on c.course_id = me.course_id where (sct.grade IN ('F','FF') OR sct.grade IS NUll) AND me.type='First_makeup' AND student_id = " + id + " AND sct.semester_code <> \'" + semester + "\'", conn);


            SqlDataReader rdr = cmd2.ExecuteReader();
            while (rdr.Read())
            {
                ddl.Items.Add(new ListItem("" + rdr["name"], "" + rdr["course_id"]));
            }
        }
        protected void register(object sender, EventArgs e)
        {
            if (ddl.SelectedValue == "-1")
            {
                status2.InnerHtml = "Please select a course";
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
                int id = Int16.Parse(Session["id"].ToString());
                SqlCommand cmd = new SqlCommand("Procedures_StudentRegisterFirstMakeup", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@StudentID", id));
                cmd.Parameters.Add(new SqlParameter("@courseID", courseid));
                cmd.Parameters.Add(new SqlParameter("@studentCurrent_semester", semester));

                cmd.ExecuteNonQuery();

                status1.InnerHtml = "Makeup successfully Registered";
                status2.InnerHtml = "";
            }


        }
    }
}