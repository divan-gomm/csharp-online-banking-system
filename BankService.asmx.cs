/* 
 * Author: Divan Gomm
 * Page: BankService
 * Description: Provides methods to interact with the bank’s data such as retrieving accounts, transactions,
 * and performing operations like deposits or withdrawals. 
 */

using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace BillionBank
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class BankService : WebService
    {
        string connString = ConfigurationManager.ConnectionStrings["BillionBanksDB"].ConnectionString;

        // LOGIN
        [WebMethod]
        public DataTable Login(string email, string password)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT CustomerID, FullName FROM Customers WHERE Email=@Email AND Password=@Password", conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable("LoginResult");
                da.Fill(dt);
                return dt;
            }
        }

        // GET ACCOUNTS
        [WebMethod]
        public DataTable GetAccounts(int customerID)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT AccountID, AccountNumber, CurrentBalance, CreationDate FROM Accounts WHERE CustomerID=@CustomerID", conn);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable("Accounts");
                da.Fill(dt);
                return dt;
            }
        }

        // GET TRANSACTIONS
        [WebMethod]
        public DataSet GetTransactions(int accountID)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT TransactionID, SourceAccountID, DestinationAccountID, Amount, DateCreated " +
                    "FROM Transactions " +
                    "WHERE SourceAccountID=@AccountID OR DestinationAccountID=@AccountID " +
                    "ORDER BY DateCreated DESC", conn);

                cmd.Parameters.AddWithValue("@AccountID", accountID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "Transactions");
                return ds;
            }
        }

        // GET BALANCE
        [WebMethod]
        public decimal GetBalance(int accountID)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT CurrentBalance FROM Accounts WHERE AccountID=@AccountID", conn);
                cmd.Parameters.AddWithValue("@AccountID", accountID);

                conn.Open();
                object result = cmd.ExecuteScalar();
                return (result != null) ? Convert.ToDecimal(result) : 0;
            }
        }

        // MONEY TRANSFER TRANSACTIONS
        [WebMethod]
        public string Transfer(int sourceAccountID, int destinationAccountID, decimal amount)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlTransaction trans = conn.BeginTransaction();

                try
                {
                    // Check balance
                    SqlCommand check = new SqlCommand(
                        "SELECT CurrentBalance FROM Accounts WHERE AccountID=@ID", conn, trans);
                    check.Parameters.AddWithValue("@ID", sourceAccountID);

                    decimal balance = Convert.ToDecimal(check.ExecuteScalar());

                    if (balance < amount)
                    {
                        trans.Rollback();
                        return "Insufficient funds";
                    }

                    // Deduct
                    SqlCommand deduct = new SqlCommand(
                        "UPDATE Accounts SET CurrentBalance=CurrentBalance-@Amount WHERE AccountID=@ID", conn, trans);
                    deduct.Parameters.AddWithValue("@Amount", amount);
                    deduct.Parameters.AddWithValue("@ID", sourceAccountID);
                    deduct.ExecuteNonQuery();

                    // Add
                    SqlCommand add = new SqlCommand(
                        "UPDATE Accounts SET CurrentBalance=CurrentBalance+@Amount WHERE AccountID=@ID", conn, trans);
                    add.Parameters.AddWithValue("@Amount", amount);
                    add.Parameters.AddWithValue("@ID", destinationAccountID);
                    add.ExecuteNonQuery();

                    // Log transaction
                    SqlCommand log = new SqlCommand(
                        "INSERT INTO Transactions (SourceAccountID, DestinationAccountID, Amount, DateCreated) " +
                        "VALUES (@S,@D,@A,GETDATE())", conn, trans);
                    log.Parameters.AddWithValue("@S", sourceAccountID);
                    log.Parameters.AddWithValue("@D", destinationAccountID);
                    log.Parameters.AddWithValue("@A", amount);
                    log.ExecuteNonQuery();

                    trans.Commit();
                    return "Transfer successful!";
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    return "Error: " + ex.Message;
                }
            }
        }

        // CREATE ACCOUNT
        [WebMethod]
        public string CreateAccount(int customerID, decimal initialDeposit)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string accountNumber = "ACC" + DateTime.Now.Ticks;

                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Accounts (CustomerID, AccountNumber, CurrentBalance, CreationDate) " +
                    "VALUES (@CID, @Acc, @Bal, GETDATE())", conn);
                cmd.Parameters.AddWithValue("@CID", customerID);
                cmd.Parameters.AddWithValue("@Acc", accountNumber);
                cmd.Parameters.AddWithValue("@Bal", initialDeposit);
                cmd.ExecuteNonQuery();

                return "Success:" + accountNumber;
            }
        }

        // DELETE ACCOUNT
        [WebMethod]
        public string DeleteAccount(int accountID)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                SqlCommand checkbal = new SqlCommand(
                    "SELECT CurrentBalance FROM Accounts WHERE AccountID=@ID", conn);
                checkbal.Parameters.AddWithValue("@ID", accountID);

                decimal balance = Convert.ToDecimal(checkbal.ExecuteScalar());

                if (balance != 0)
                    return "Balance must be zero to delete an account!";

                SqlCommand del = new SqlCommand("DELETE FROM Accounts WHERE AccountID=@ID", conn);
                del.Parameters.AddWithValue("@ID", accountID);
                del.ExecuteNonQuery();

                return "Successfully deleted your account!";
            }
        }

        // GET CUSTOMER DETAILS
        [WebMethod]
        public DataTable GetCustomerDetails(int customerID)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT FullName, IDNumber, Address, ContactNumber, Email, Password " +
                    "FROM Customers WHERE CustomerID = @CustomerID", conn);

                cmd.Parameters.AddWithValue("@CustomerID", customerID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable("CustomerDetails");
                da.Fill(dt);

                return dt;
            }
        }

        // UPDATE CUSTOMER PROFILE
        [WebMethod]
        public string UpdateCustomerProfile(int customerID, string fullName, string idNumber, string address, string contact, string email, string password)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(
                    @"UPDATE Customers SET FullName=@FullName, IDNumber=@IDNumber, Address=@Address, 
                      ContactNumber=@ContactNumber, Email=@Email, Password=@Password 
                      WHERE CustomerID=@CustomerID", conn);

                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@IDNumber", idNumber);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@ContactNumber", contact);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);

                int rows = cmd.ExecuteNonQuery();
                return (rows > 0) ? "Profile updated successfully!" : "Profile update failed!";
            }
        }

        // SECURITY QUESTION
        [WebMethod]
        public DataTable GetSecurityQuestion(string email)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT SecurityQuestion FROM Customers WHERE Email=@Email", conn);
                cmd.Parameters.AddWithValue("@Email", email);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable("SecurityQuestion");
                da.Fill(dt);

                return dt;
            }
        }

        // VERIFY SECURITY ANSWER
        [WebMethod]
        public bool VerifySecurityAnswer(string email, string answer)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT SecurityAnswer FROM Customers WHERE Email=@Email", conn);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                object result = cmd.ExecuteScalar();

                return result != null && result.ToString().Equals(answer, StringComparison.OrdinalIgnoreCase);
            }
        }

        // RESET PASSWORD
        [WebMethod]
        public string ResetPassword(string email, string newPassword)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Customers SET Password=@Password WHERE Email=@Email", conn);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                return (rows > 0) ? "Password reset successfully!" : "Password reset failed!";
            }
        }
    }
}
