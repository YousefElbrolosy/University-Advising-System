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
    public partial class View_his_her_students2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
               
                conn.Open();
                SqlCommand cmd1 = new SqlCommand("select * FROM Student WHERE advisor_id=@advisor_id", conn);
                 int id = Int16.Parse(Session["id"].ToString());
                //int id = 2;
                cmd1.Parameters.Add(new SqlParameter("@advisor_id", id));

                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Visible = true;


        }
        }


}