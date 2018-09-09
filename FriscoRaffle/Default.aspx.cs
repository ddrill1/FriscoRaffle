using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.Drawing;

namespace FriscoRaffle
{
    public partial class Default : System.Web.UI.Page
    {
        public Boolean error = false;
        int referral = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void updateDB()
        {
            if (rdbYes.Checked == true)
            {
                referral = 1;
            }
            else if (rdbNo.Checked == true)
            {
                referral = 0;
            }

            string connString = ConfigurationManager.ConnectionStrings["FriscoDBConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("sp_Update", connection);

            using (connection)
            {
                try
                {
                    connection.Open();

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@firstName", txtFirst.Text);
                    cmd.Parameters.AddWithValue("@lastName", txtLast.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@referral", referral);

                    cmd.ExecuteNonQuery();

                    connection.Close();
                }
                catch (Exception)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", " < script > alert('Server connection issues. Try again.');</ script > ");
                    return;
                }

                txtFirst.Text = "";
                txtLast.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                rdbYes.Checked = false;
                rdbNo.Checked = false;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            updateDB();
        }
    }
}