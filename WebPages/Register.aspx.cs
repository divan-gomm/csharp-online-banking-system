/* 
    Author: Divan Gomm
    Page: Register.aspx.cs
    Description: 
    Handles user registration.
    Collects user details, validates input, and creates new customer accounts.
*/

using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;

namespace BillionBank.WebPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Method for register button click
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txbFullName.Text.Trim();
            string email = txbEmail.Text.Trim();
            string password = txbPassword.Text.Trim();
            string idNumber = txbID.Text.Trim();
            string address = txbAddress.Text.Trim();
            string contact = txbContactNumber.Text.Trim();
            string secQuestion = txbSecurityQuestion.Text.Trim();
            string secAnswer = txbSecurityAnswer.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["BillionBanksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Check if email exists
                SqlCommand checkEmail = new SqlCommand(
                    "SELECT COUNT(*) FROM Customers WHERE Email = @Email", conn);
                checkEmail.Parameters.AddWithValue("@Email", email);

                int exists = (int)checkEmail.ExecuteScalar();
                if (exists > 0)
                {
                    lblMessage.Text = "Email already exists! Please use another email.";
                    return;
                }

                // Insert new customer
                SqlCommand insertCustomer = new SqlCommand(@"
                    INSERT INTO Customers (FullName, Email, Password, IDNumber, Address, ContactNumber, SecurityQuestion, SecurityAnswer)
                    VALUES (@FullName, @Email, @Password, @IDNumber, @Address, @ContactNumber, @SecurityQuestion, @SecurityAnswer);
                    SELECT SCOPE_IDENTITY();", conn);

                insertCustomer.Parameters.AddWithValue("@FullName", fullName);
                insertCustomer.Parameters.AddWithValue("@Email", email);
                insertCustomer.Parameters.AddWithValue("@Password", password);
                insertCustomer.Parameters.AddWithValue("@IDNumber", idNumber);
                insertCustomer.Parameters.AddWithValue("@Address", address);
                insertCustomer.Parameters.AddWithValue("@ContactNumber", contact);
                insertCustomer.Parameters.AddWithValue("@SecurityQuestion", secQuestion);
                insertCustomer.Parameters.AddWithValue("@SecurityAnswer", secAnswer);

                int customerID = Convert.ToInt32(insertCustomer.ExecuteScalar());

                // Create first account using the web service
                try
                {
                    BankService service = new BankService();
                    string accountNumber = service.CreateAccount(customerID, 100.00m); // initial deposit

                    lblMessage.Text = $"Registration successful! First account created: {accountNumber}. You can now log in.";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Registration successful, but failed to create account: " + ex.Message;
                }
            }
        }
    }
}
