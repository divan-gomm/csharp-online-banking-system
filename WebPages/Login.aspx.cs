/* 
    Author: Divan Gomm
    Page: Login.aspx.cs
    Description: 
    Handles user authentication for logging in.
    Validates credentials and manages session variables.
*/

using System;
using System.Web.UI;
using System.Data;

namespace BillionBank.WebPages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: clear previous messages on page load
            lblMessage.Text = "";
        }

        //Method for login button click
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtboxUserName.Text.Trim();
            string password = txtboxPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both email and password!";
                return;
            }

            try
            {
                // Create web service client
                BankService service = new BankService();

                // Call the login method
                DataTable dt = service.Login(email, password);

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    // Save session variables
                    Session["CustomerID"] = Convert.ToInt32(row["CustomerID"]);
                    Session["FullName"] = row["FullName"].ToString();

                    // Redirect to account details page
                    Response.Redirect("AccountDetails.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error connecting to login service: " + ex.Message;
            }
        }
    }
}
