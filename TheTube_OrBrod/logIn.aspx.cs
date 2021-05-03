using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        massege.Text = "";
        massege2.Text = "";
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (userName.Text == "admin" && password.Text == "telem")
        {
            Response.Redirect("gamesTable.aspx");
        }
        if(userName.Text == "admin" && password.Text != "telem")
        {
            massege.Text = "*סיסמא שגויה";
        }
        if (userName.Text != "admin" && password.Text == "telem")
        {
            massege.Text = "*שם משתמש שגוי";
        }
        if (userName.Text != "admin" && password.Text != "telem")
        {
            massege.Text = "*סיסמא ושם משתמש שגויים";
        }
        if(userName.Text==""&& password.Text == "")
        {
            massege2.Text = "*שם משתמש וסיסמא חייבים להכיל ערך";
            massege.Text = "";
        }
        if (userName.Text == "" && password.Text != "")
        {
            massege2.Text = "*שם משתמש חייב להכיל ערך";
        }
        if (userName.Text != "" && password.Text == "")
        {
            massege2.Text = "*סיסמא חייבת להכיל ערך";
        }



    }
}