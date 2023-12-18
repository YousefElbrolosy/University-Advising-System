using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;

namespace DBProject.Advisor
{
    public partial class PendingRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        private void BindGridView()
        {
            int id = Int16.Parse(Session["id"].ToString());
            //int advisorid = 2;

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Procedures_AdvisorViewPendingRequests", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Advisor_ID", id));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            int id = Int16.Parse(Session["id"].ToString());
            //int advisorid = 2;

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Procedures_AdvisorViewPendingRequests", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Advisor_ID", id));



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
                for (int i = 0; i < e.Row.Cells.Count - 1; i++)
                {
                    TableCell cell = e.Row.Cells[i];
                    if (string.IsNullOrEmpty(cell.Text) || cell.Text == "&nbsp;")
                    {
                        cell.Text = "-";
                    }
                }

            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ButtonClick")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridView1.Rows[rowIndex];
                    string reqValue = row.Cells[0].Text;
                    string type = row.Cells[1].Text;
                    int reqid = Convert.ToInt16(reqValue);


                    string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
                    SqlConnection con = new SqlConnection(connStr);
                    SqlCommand sqlCommand = new SqlCommand("SELECT semester_code FROM Semester Where CURRENT_TIMESTAMP Between start_date AND end_date", con);
                    con.Open();
                    string st = sqlCommand.ExecuteScalar().ToString();
                    SqlCommand cmd;
                    if (type == "course")
                    {
                        cmd = new SqlCommand("Procedures_AdvisorApproveRejectCourseRequest", con);
                        cmd.Parameters.Add(new SqlParameter("@current_semester_code", st));

                    }
                    else
                    {
                        cmd = new SqlCommand("Procedures_AdvisorApproveRejectCHRequest", con);
                        cmd.Parameters.Add(new SqlParameter("@Current_semester_code", st));
                    }

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@RequestID", reqid));
                    cmd.ExecuteNonQuery();
                    BindGridView();
                }

            }
            catch (Exception)
            {

            }
        }
    }
}