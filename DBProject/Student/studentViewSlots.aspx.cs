using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trial
{
    public partial class studentViewSlots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadInstructors(sender, e);
                loadcourses(sender, e);
                //GridView1.DataBind();
            }
        }

        protected void loadcourses(object sender, EventArgs e)
        {
                
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
            //ddl.Items.Clear();
           // ddl.Items.Add(new ListItem("Select Course", "-1"));
            //bageb el courses el instructors ll course elly m5taro
            SqlCommand cmd2 = new SqlCommand("select name,course_id from Course", conn);
                //SqlCommand cmd3 = new SqlCommand("select c.name,c.course_id from course c inner Join Instructor_Course ic on c.course_id=ic.course_id where ic.instructor_id = "+ddl2.SelectedValue, conn);
                conn.Open();
                SqlDataReader rdr;
            //if (Int32.Parse(ddl2.SelectedValue) == -1)
            //{ //didnt choose an instructor yet
                rdr = cmd2.ExecuteReader();
                
           // }
            //else//chose an instructor
           // {
                //rdr = cmd3.ExecuteReader();
            //}
                while (rdr.Read())
                {
                    ddl.Items.Add(new ListItem("" + rdr["name"], "" + rdr["course_id"]));
                }
            

        }
        protected void loadInstructors(object sender, EventArgs e)
        {

            //ddl2.Items.Clear();
            //ddl2.Items.Add(new ListItem("Select Instructor", "-1"));
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //bageb el courses el instructors ll course elly m5taro
            SqlCommand cmd2 = new SqlCommand("select name,instructor_id from Instructor ", conn);
            //SqlCommand cmd3 = new SqlCommand("select i.name,i.instructor_id from Instructor i inner Join Instructor_Course ic on i.instructor_id=ic.instructor_id where ic.course_id = " + ddl.SelectedValue, conn);

            conn.Open();
            SqlDataReader rdr;
            //if (Int32.Parse(ddl2.SelectedValue) == -1) { 
            rdr = cmd2.ExecuteReader();
                
            //}
           // else
                //rdr = cmd3.ExecuteReader();

       
                while (rdr.Read())
                {
                    ddl2.Items.Add(new ListItem("" + rdr["name"], "" + rdr["instructor_id"]));
                }
            

        }
        protected void show(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            int courseid = Int32.Parse(ddl.SelectedValue);
            int instructorid = Int32.Parse(ddl2.SelectedValue);
            if (courseid == -1 || instructorid == -1)
            {
                Label1.Visible = true;
                myTable.Visible = false;
            }
            else {
                Label1.Visible = false;
                SqlCommand cmd = new SqlCommand("select * from FN_StudentViewSlot(@CourseID,@InstructorID)", conn);
                cmd.Parameters.Add(new SqlParameter("@CourseID", courseid));
                cmd.Parameters.Add(new SqlParameter("@InstructorID", instructorid));
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                myTable.Visible = true;
            }
          
        }


    }
}