using System;
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
    public partial class View_All_Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from dbo.FN_Advisors_Requests(@advisorID)", conn);
            conn.Open();
            int id = Int16.Parse(Session["id"].ToString());
            //int id = 3;
            cmd.Parameters.Add(new SqlParameter("@advisorID", id));
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();




        }
    }
}