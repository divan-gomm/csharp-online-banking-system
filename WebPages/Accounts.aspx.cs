
//Author: Divan Gomm
//Page: Accounts.aspx.cs
//Description: 
//Displays a list of all user accounts.
//Provides navigation to account details pages.


using System;
using System.Data;

namespace BillionBank.WebPages
{
    public partial class Accounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect if not logged in
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                int customerID = Convert.ToInt32(Session["CustomerID"]);
                LoadAccounts(customerID);
            }
        }

        // Load all accounts for the logged-in customer using web service
        private void LoadAccounts(int customerID)
        {
            try
            {
                // Create web service client
                BankService service = new BankService();

                // Get all accounts for this customer
                DataTable accounts = service.GetAccounts(customerID);

                if (accounts != null && accounts.Rows.Count > 0)
                {
                    // Bind accounts to GridView
                    gvAccounts.DataSource = accounts;
                    gvAccounts.DataBind();
                    lblMessage.Text = ""; // Clear any previous messages
                }
                else
                {
                    gvAccounts.DataSource = null;
                    gvAccounts.DataBind();
                    lblMessage.Text = "No accounts found!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading accounts: " + ex.Message;
            }
        }
    }
}
