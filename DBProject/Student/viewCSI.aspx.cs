using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trial
{
    public partial class viewCSI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_Team_61"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Courses_Slots_Instructor", conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {

                String courseid = "" + rdr["CourseID"];
                String coursename = "" + rdr["Course name"];
                String slotid = "" + rdr["Slot ID"];
                String slotday = "" + rdr["Slot Day"];
                String slottime = "" + rdr["Slot Time"];
                String slot_location = "" + rdr["Slot Location"];
                String iname = "" + rdr["Slot’s Instructor name"];
               if(courseid == "")
                {
                    courseid = "-";
                }
               if (coursename == "")
                {
                    coursename = "-";
                }
               if (slotid == "")
                {
                      slotid = "-";
                 }
               if (slotday == "")
                {
                    slotday = "-";
                }
               if (slottime == "")
                {
                      slottime = "-";
                 }
               if (slot_location == "")
                {
                    slot_location = "-";
                }
               if (iname == "")
                {
                      iname = "-";
                 }

                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
           
                cell1.Text = courseid;
                cell2.Text = coursename;
                cell3.Text = slotid;
                cell4.Text = slotday;
                cell5.Text = slottime;
                cell6.Text = slot_location;
                cell7.Text = iname;
           
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
              
                myTable.Controls.Add(row);
            }
            if (myTable.Rows.Count == 1)
            {
                lblEmptyMessage.Visible = true;
                myTable.Visible = false;
            }
        }
    }
}