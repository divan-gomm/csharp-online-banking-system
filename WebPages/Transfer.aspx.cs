/* 
    Author: Divan Gomm
    Page: Transactions.aspx.cs
    Description: 
    Handles viewing and managing transactions for user accounts.
    Supports filtering and displaying transaction history.
*/

using System;
using System.Web.UI;
using System.Data;

namespace BillionBank.WebPages
{
    public partial class Transfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Redirect if not logged in
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

        //Method for loading accounts
        private void LoadAccounts(int customerID)
        {
            try
            {
                BankService service = new BankService();
                DataTable accounts = service.GetAccounts(customerID);

                ddlFromAccount.DataSource = accounts;
                ddlFromAccount.DataTextField = "AccountNumber";
                ddlFromAccount.DataValueField = "AccountID";
                ddlFromAccount.DataBind();

                ddlToAccount.DataSource = accounts;
                ddlToAccount.DataTextField = "AccountNumber";
                ddlToAccount.DataValueField = "AccountID";
                ddlToAccount.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading accounts: " + ex.Message;
            }
        }

        //Button click method for transfering money
        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (Session["CustomerID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int fromAccountID = Convert.ToInt32(ddlFromAccount.SelectedValue);
            int toAccountID = Convert.ToInt32(ddlToAccount.SelectedValue);

            if (fromAccountID == toAccountID)
            {
                lblMessage.Text = "Source and destination accounts cannot be the same!";
                return;
            }

            if (!decimal.TryParse(tbAmount.Text.Trim(), out decimal amount) || amount <= 0)
            {
                lblMessage.Text = "Enter a valid transfer amount!";
                return;
            }

            try
            {
                BankService service = new BankService();
                string result = service.Transfer(fromAccountID, toAccountID, amount);

                lblMessage.Text = result;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error during transfer: " + ex.Message;
            }
        }
    }
}
