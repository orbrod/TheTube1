using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Defenitions : System.Web.UI.Page
{
    protected void page_init(object sender, EventArgs e)
    {
        string gameId = Session["GameIDSession"].ToString();
        XmlDocument myDoc = new XmlDocument();
        myDoc.Load(Server.MapPath("tree/XMLFile1.xml"));

        XmlNode myGame = myDoc.SelectSingleNode("/project/game[@gameCode=" + gameId + "]/gameName");
        gameName.Text = Server.UrlDecode(myGame.InnerText);
        TextBox1.Text = Server.UrlDecode(myGame.InnerText);
        QuestLbl.Text = TextBox1.Text.Length + "/60";
        XmlNode instruction = myDoc.SelectSingleNode("/project/game[@gameCode=" + gameId + "]/gameInstruction");
        TextBox2.Text = Server.UrlDecode(instruction.InnerText);
        QuestLbl2.Text = TextBox2.Text.Length + "/60";
        gameNameLbl.Text = "שם המשחק";
        instrLbl.Text = "הנחיה";
        


 
    }
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        string gameId = Session["GameIDSession"].ToString();
        XmlDocument myDoc = new XmlDocument();
        myDoc.Load(Server.MapPath("tree/XMLFile1.xml"));
        XmlNode myGame = myDoc.SelectSingleNode("/project/game[@gameCode=" + gameId + "]/gameName");
        myGame.InnerText = Server.UrlEncode(TextBox1.Text);//קידוד שם משחק שהמתשמש הזין
        XmlNode instruction = myDoc.SelectSingleNode("/project/game[@gameCode=" + gameId + "]/gameInstruction");
        instruction.InnerText = Server.UrlEncode(TextBox2.Text);
        myDoc.Save(Server.MapPath("tree/XMLFile1.xml"));
        Response.Redirect("Edit.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        string gameId = Session["GameIDSession"].ToString();
        XmlDocument myDoc = new XmlDocument();
        myDoc.Load(Server.MapPath("tree/XMLFile1.xml"));
        XmlNode myGame = myDoc.SelectSingleNode("/project/game[@gameCode=" + gameId + "]/gameName");
        myGame.InnerText = Server.UrlEncode(TextBox1.Text);//קידוד שם משחק שהמתשמש הזין
        XmlNode instruction = myDoc.SelectSingleNode("/project/game[@gameCode=" + gameId + "]/gameInstruction");
        instruction.InnerText = Server.UrlEncode(TextBox2.Text);
        myDoc.Save(Server.MapPath("tree/XMLFile1.xml"));
        Response.Redirect("gamesTable.aspx");
    }

    protected void back_Click(object sender, ImageClickEventArgs e)
    {
        goBack.Visible = true;
        grayBack.Visible = true;

    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        goBack.Visible = false;
        grayBack.Visible = false;
    }

    protected void confirm_Click(object sender, EventArgs e)
    {
        Response.Redirect("gamesTable.aspx");
    }
}