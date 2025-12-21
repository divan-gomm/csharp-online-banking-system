/* 
  Author: Divan Gomm
  Page: ForgotPassword.aspx
  Description:
  Allows a user to reset their password if they have forgotten it.
  The user enters their email, then the security question is displayed.
  The user must provide the correct answer to the security question before resetting the password.
*/


using System;
using System.Web.UI;
using System.Data;

namespace BillionBank.WebPages
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        BillionBank.BankService service = new BillionBank.BankService();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Method for finding security question in DB
        protected void btnFindQuestion_Click(object sender, EventArgs e)
        {
            string email = tbEmail.Text.Trim();

            try
            {
                DataTable dt = service.GetSecurityQuestion(email);

                if (dt != null && dt.Rows.Count > 0)
                {
                    lblQuestion.Text = dt.Rows[0]["SecurityQuestion"].ToString();
                    tbAnswer.Enabled = true;
                    btnVerifyQuestion.Enabled = true;
                    lblMessage.Text = "";
                }
                else
                {
                    lblQuestion.Text = "";
                    tbAnswer.Enabled = false;
                    btnVerifyQuestion.Enabled = false;
                    lblMessage.Text = "Email not found!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error fetching security question: " + ex.Message;
            }
        }
    
        //Method for verifying security question
        protected void btnVerifyQuestion_Click(object sender, EventArgs e)
        {
            string email = tbEmail.Text.Trim();
            string answer = tbAnswer.Text.Trim();

            try
            {
                BankService service = new BankService();
                bool isCorrect = service.VerifySecurityAnswer(email, answer); // NEW method in web service

                lblMessage.Text = isCorrect ? "Answer correct. Enter a new password." : "Incorrect answer!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error verifying answer: " + ex.Message;
            }
        }

        //Method for reset password button click
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = tbEmail.Text.Trim();
            string newPassword = tbNewPassword.Text.Trim();
            string confirmPassword = tbConfirmPassword.Text.Trim();

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            try
            {
                BankService service = new BankService();
                string result = service.ResetPassword(email, newPassword); // NEW method in web service
                lblMessage.Text = result;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error resetting password: " + ex.Message;
            }
        }
    }
}
