using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trial
{
    public partial class View_his_her_students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ddl.SelectedValue == "-1")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
               
                conn.Open();
                SqlCommand cmd1 = new SqlCommand("select distinct(major) from Student", conn);
               
            


                SqlDataReader rdr = cmd1.ExecuteReader();
                while (rdr.Read())
                {
                    ddl.Items.Add(new ListItem("" + rdr["major"], "" + rdr["major"]));
                }

            }
        }

        protected void View(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            int id = Int16.Parse(Session["id"].ToString());
            //int id = 2;
            if (ddl.SelectedValue == "-1")
            {
                err.InnerHtml = "Please specify a major";
                GridView1.Visible = false;
                return;
            }
            err.InnerHtml = "";
           
            //bageb el students bto3o ll major elly m5taro
            SqlCommand cmd2 = new SqlCommand("Procedures_AdvisorViewAssignedStudents", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add(new SqlParameter("@AdvisorID", id));
            cmd2.Parameters.Add(new SqlParameter("@Major", ddl.SelectedValue));
            SqlDataAdapter sda = new SqlDataAdapter(cmd2);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.Visible = true;




        }
    }
}