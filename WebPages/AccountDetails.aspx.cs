/*
 * Author: Divan Gomm
 * Page: AccountDetails.aspx
 * Description: 
 *      Displays the logged-in customer's bank accounts and recent transactions.
 *      Redirects to Login.aspx if the user is not authenticated.
 *      Fetches account and transaction data using the BankService web service.
 */
       

using System;
using System.Data;
using System.Web.UI;
using System.IO;

namespace BillionBank.Pages
{
    public partial class AccountDetails : System.Web.UI.Page
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

                // Set welcome message
                lblWelcome.Text = "Welcome, " + Session["FullName"];

                LoadAccounts(customerID);
            }
        }

        private void LoadAccounts(int customerID)
        {
            try
            {
                // Create web service client
                BillionBank.BankService service = new BillionBank.BankService();

                // Get accounts
                DataTable dtAccounts = service.GetAccounts(customerID);

                if (dtAccounts != null && dtAccounts.Rows.Count > 0)
                {
                    gvAccounts.DataSource = dtAccounts;
                    gvAccounts.DataBind();

                    // Load transactions for the first account
                    int firstAccountID = Convert.ToInt32(dtAccounts.Rows[0]["AccountID"]);
                    LoadTransactions(firstAccountID);
                }
                else
                {
                    lblMessagetoView.Text = "No accounts found.";
                }
            }
            catch (Exception ex)
            {
                lblMessagetoView.Text = "Error loading accounts: " + ex.Message;
            }
        }

        //Method for loading transactions
        private void LoadTransactions(int accountID)
        {
            try
            {
                BillionBank.BankService service = new BillionBank.BankService();
                DataTable dtTransactions = service.GetTransactions(accountID).Tables[0];

                if (dtTransactions != null && dtTransactions.Rows.Count > 0)
                {
                    gvTransactions.DataSource = dtTransactions;
                    gvTransactions.DataBind();

                    LogTransaction(string.Format("Loaded {0} transactions for AccountID {1}", dtTransactions.Rows.Count, accountID));
                }
                else
                {
                    lblTransactionMessage.Text = "No recent transactions found.";
                    LogTransaction(string.Format("No transactions found for AccountID {0}", accountID));
                }
            }
            catch (Exception ex)
            {
                lblTransactionMessage.Text = "Error loading transactions: " + ex.Message;
                LogTransaction(string.Format("Error loading transactions for AccountID {0}: {1}", accountID, ex.Message));
            }
        }

        //Logging transactions to TransactionLogs file
        private void LogTransaction(string message)
        {
            try
            {
                string logPath = Server.MapPath("~/transaction_log.txt");
                using (StreamWriter writer = new StreamWriter(logPath, true))
                {
                    writer.WriteLine(string.Format("{0:G} - {1}", DateTime.Now, message));
                }
            }
            catch (Exception ex)
            {
                lblMessagetoView.Text = "Error: " + ex.Message;
            }
        }



    }
}
