/* 
    Author: Divan Gomm
    Page: AdditionalAccounts.aspx.cs
    Description: 
    Handles displaying and managing any additional accounts for the user.
    Allows viewing account details, balances, and navigating to transaction history.
*/

using System;
using System.Data;

namespace BillionBank.Pages
{
    public partial class AdditionalAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CustomerID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                int customerID = Convert.ToInt32(Session["CustomerID"]);
                LoadAccounts(customerID);
            }
        }

        // Load accounts into DropDownList using the web service
        private void LoadAccounts(int customerID)
        {
            try
            {
                BankService service = new BankService();
                DataTable accounts = service.GetAccounts(customerID);

                ddlDeleteAccount.DataSource = accounts;
                ddlDeleteAccount.DataTextField = "AccountNumber";
                ddlDeleteAccount.DataValueField = "AccountID";
                ddlDeleteAccount.DataBind();
            }
            catch (Exception ex)
            {
                lblMessageDeleteAcc.Text = "Error loading accounts: " + ex.Message;
            }
        }

        // Create a new account using the web service
        protected void btnApply_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int customerID = Convert.ToInt32(Session["CustomerID"]);
            decimal deposit = 0;

            if (!decimal.TryParse(tbDeposit.Text.Trim(), out deposit) || deposit < 0)
            {
                lblMessage.Text = "Enter a valid initial deposit!";
                return;
            }

            try
            {
                BankService service = new BankService();
                string resultMessage = service.CreateAccount(customerID, deposit); // service returns account info
                lblMessage.Text = resultMessage;

                LoadAccounts(customerID); // refresh dropdown
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error creating account: " + ex.Message;
            }
        }

        // Delete selected account using web service
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            DeleteSelectedAccount();
        }

        private void DeleteSelectedAccount()
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            lblMessageDeleteAcc.Text = "";

            if (ddlDeleteAccount.SelectedValue == null)
            {
                lblMessageDeleteAcc.Text = "Please select an account to delete!";
                return;
            }

            int accountID = Convert.ToInt32(ddlDeleteAccount.SelectedValue);

            try
            {
                BankService service = new BankService();
                string resultMessage = service.DeleteAccount(accountID); // service returns string

                lblMessageDeleteAcc.Text = resultMessage;

                int customerID = Convert.ToInt32(Session["CustomerID"]);
                LoadAccounts(customerID); // refresh dropdown
            }
            catch (Exception ex)
            {
                lblMessageDeleteAcc.Text = "Error deleting account: " + ex.Message;
            }
        }

        // Optional: clear previous messages when selection changes
        protected void ddlDeleteAccount_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMessageDeleteAcc.Text = "";
        }
    }
}
