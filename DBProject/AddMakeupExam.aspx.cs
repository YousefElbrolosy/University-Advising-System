using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AddMakeupExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
         populateDropDown();   
        }

        public void populateDropDown()
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
                    Cddl.Items.Add(new ListItem(rdr["name"].ToString(), "" + rdr["course_id"]));
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Cddl.SelectedValue == "-1")
            {
                e1.InnerHtml = "Please specify a course";
                examresp.InnerText = "";

            }
            else
                e1.InnerHtml = "";
            if (typeddl.SelectedValue == "-1")
            {
                e2.InnerHtml = "Please specify a type";
                examresp.InnerText = "";
            }
            else
                e2.InnerHtml = "";
            DateTime enteredDate;
            if (!DateTime.TryParse(txtInput.Text, out enteredDate))
            {
                e3.InnerHtml = "Invalid date";
                examresp.InnerText = "";

            }
            else
                e3.InnerHtml = "";
            if (Cddl.SelectedValue == "-1" || typeddl.SelectedValue == "-1" || !DateTime.TryParse(txtInput.Text, out enteredDate))
                    return;

            int crsid = Int32.Parse(Cddl.SelectedValue);
            String type = typeddl.SelectedValue;
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Procedures_AdminaddExam", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@type", type));
            cmd.Parameters.Add(new SqlParameter("@date",enteredDate) );
            cmd.Parameters.Add(new SqlParameter("@course_id", crsid));
            conn.Open();
            cmd.ExecuteNonQuery();
            examresp.InnerText = "Exam Successfully added";

           

            

        }
    }
}