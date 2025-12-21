/* 
 * Author: Divan Gomm
 * Page: EditProfile
 * Description: Allows the user to view and update their profile information such as name, email, and contact details.
 */

using System;
using System.Data;
using System.Web.UI;

namespace BillionBank.WebPages
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCustomerDetails();
            }
        }

        //Method to load customer details 
        private void LoadCustomerDetails()
        {
            int customerID = Convert.ToInt32(Session["CustomerID"]);
            try
            {
                BankService service = new BankService();
                DataTable dt = service.GetCustomerDetails(customerID); // <-- new web service method

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    tbName.Text = row["FullName"].ToString();
                    tbID.Text = row["IDNumber"].ToString();
                    tbAddress.Text = row["Address"].ToString();
                    tbContact.Text = row["ContactNumber"].ToString();
                    tbEmail.Text = row["Email"].ToString();
                    tbPassword.Text = row["Password"].ToString();
                    tbConfirmPassword.Text = row["Password"].ToString();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading profile: " + ex.Message;
            }
        }

        //Button method to confirm change of profile
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int customerID = Convert.ToInt32(Session["CustomerID"]);

            string fullName = tbName.Text.Trim();
            string idNumber = tbID.Text.Trim();
            string address = tbAddress.Text.Trim();
            string contact = tbContact.Text.Trim();
            string email = tbEmail.Text.Trim();
            string password = tbPassword.Text.Trim();
            string confirmPassword = tbConfirmPassword.Text.Trim();

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            try
            {
                BankService service = new BankService();
                string result = service.UpdateCustomerProfile(customerID, fullName, idNumber, address, contact, email, password);
                lblMessage.Text = result;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating profile: " + ex.Message;
            }
        }
    }
}
