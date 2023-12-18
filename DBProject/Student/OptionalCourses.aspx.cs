using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProject
{
    public partial class OptionalCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Int16.Parse(Session["id"].ToString());
            

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand sqlCommand = new SqlCommand("SELECT semester_code FROM Semester Where CURRENT_TIMESTAMP Between start_date AND end_date", con);
            con.Open();
            string st = sqlCommand.ExecuteScalar().ToString();


            SqlCommand cmd = new SqlCommand("Procedures_ViewOptionalCourse", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@StudentID", id));
            cmd.Parameters.Add(new SqlParameter("@Currentsemestercode", st));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            int id = Int16.Parse(Session["id"].ToString());


            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand sqlCommand = new SqlCommand("SELECT semester_code FROM Semester Where CURRENT_TIMESTAMP Between start_date AND end_date", con);
            con.Open();
            string st = sqlCommand.ExecuteScalar().ToString();


            SqlCommand cmd = new SqlCommand("Procedures_ViewOptionalCourse", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@StudentID", id));
            cmd.Parameters.Add(new SqlParameter("@Currentsemestercode", st));



            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string sortDirection = GetSortDirection(e.SortExpression);
            DataView dv = new DataView(dt);
            dv.Sort = e.SortExpression + " " + sortDirection;

            GridView1.DataSource = dv;
            GridView1.DataBind();
        }

        private string GetSortDirection(string column)
        {
            string sortDirection = "ASC";
            string lastSortExpression = ViewState["SortExpression"] as string;

            if (lastSortExpression != null && lastSortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }

            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell statusCell = e.Row.Cells[2];

                bool value = Convert.ToBoolean(statusCell.Text);
                statusCell.Text = value ? "Yes" : "No";
            }
        }
    }
}