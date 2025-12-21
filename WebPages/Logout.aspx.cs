/* 
 * Author: Divan Gomm
 * Page: Logout
 * Description: Clears the user's session and redirects to the login page.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BillionBank.WebPages
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Clear session
            Session.Clear();
            Session.Abandon();

            //Redirect to Login page
            Response.Redirect("Login.aspx");
        }
    }
}