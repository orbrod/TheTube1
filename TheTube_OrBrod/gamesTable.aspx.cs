using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

public partial class gamesTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            deletePanel.Visible = false;
        }
        checkBoxAble();
        
        TextBox1.MaxLength = 60;

    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // תחילה אנו מבררים מהו ה -אי די- של הפריט בעץ ה אקס אם אל
        ImageButton i = (ImageButton)e.CommandSource;
        // אנו מושכים את האי די של הפריט באמצעות מאפיין לא שמור במערכת שהוספנו באופן ידני לכפתור-תמונה
        string theId = i.Attributes["theItemId"];
        //שימוש במשתנה סשן על מנת לשמור את המשתנה בין דפים
        Session["GameIDSession"] = i.Attributes["theItemId"];

        // עלינו לברר איזו פקודה צריכה להתבצע - הפקודה רשומה בכל כפתור             
        switch (e.CommandName)
        {
            //אם נלחץ על כפתור מחיקה יקרא לפונקציה של מחיקה                    
            case "deleteRow":
                deleteRow();
                break;

            //אם נלחץ על כפתור עריכה (העפרון) נעבור לדף עריכה                    
            case "editRow":

                Response.Redirect("Edit.aspx");
                break;

            case "setRow":
                Response.Redirect("settings.aspx");
                break;
        }
    }
    public void deleteRow()
    {
        //הצגה של חלון הפופ אפ
        deletePanel.Visible = true;
        grayBack.Visible = true;
        string GameIdToDelete = Session["GameIDSession"].ToString();
        XmlDocument Document = XmlDataSource1.GetXmlDocument();
        //XmlNode node = Document.SelectSingleNode("/project/game[@gameCode=" + GameIdToDelete + "]");
        XmlNode gameName = Document.SelectSingleNode("/project/game[@gameCode=" + GameIdToDelete + "]/gameName");
        gameNameToDel.Text = Server.UrlDecode(gameName.InnerText);
        mainDel.Text = "אתה עומד למחוק את המשחק:";
    }

    protected void yesDelete_Click(object sender, EventArgs e)
    {
        //במקרה ולחץ על מחק
        
        //הסרת ענף של משחק קיים באמצעות זיהוי האיי דיי שניתן לו על ידי לחיצה עליו מתוך הטבלה
        //שמירה ועדכון לתוך העץ ולגריד ויו
        string GameIdToDelete = Session["GameIDSession"].ToString();
        XmlDocument Document = XmlDataSource1.GetXmlDocument();
        XmlNode node = Document.SelectSingleNode("/project/game[@gameCode=" + GameIdToDelete + "]");
        XmlNode gameName= Document.SelectSingleNode("/project/game[@gameCode=" + GameIdToDelete + "]/gameName");
        
        node.ParentNode.RemoveChild(node);

        XmlDataSource1.Save();
        GridView1.DataBind();
        checkBoxAble();
        //הסתרה של חלון הפופ אפ
        deletePanel.Visible = false;
        grayBack.Visible = false;
    }

    protected void noDelete_Click(object sender, EventArgs e)
    {
        //במקרה ולחץ על ביטול
        //הסתרה של חלון הפופ אפ
        deletePanel.Visible = false;
        grayBack.Visible = false;
    }



    protected void IsPublishCB_CheckedChanged(object sender, EventArgs e)
    {
        
        XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument();
        CheckBox myCheckBox = (CheckBox)sender;
        
        string theId = myCheckBox.Attributes["theItemId"];
        XmlNode count = xmlDoc.SelectSingleNode("project/game[@gameCode=" + theId + "]");
        int counter = Convert.ToInt32(count.Attributes["Counter"].Value);
        bool isCheck= myCheckBox.Checked;
        count.Attributes["editorPublish"].InnerText = isCheck.ToString();
        GridView1.DataBind();
        XmlDataSource1.Save();
        checkBoxAble();


    }

    protected void checkBoxAble()//
    {
        XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument();
        foreach (GridViewRow row in GridView1.Rows)
        {
            //חיפוש הלייבל שבו מופיע ה ID של המשחק
            Label gameCodeLbl = (Label)row.FindControl("gameCodeLbl");
            Label countLable = (Label)row.FindControl("CoupleCount");
            
            //בעזרת האי-די של המשחק נוכל לבדוק האם עומד בתנאי הפרסום
            string GameCode = gameCodeLbl.Text;

            //דוגמה לבדיקה - אם קיימים לפחות 2 שאלות
            XmlNodeList quest = xmlDoc.SelectNodes("project/game[@gameCode=" + GameCode + "]/couples/couple");

            //חיפוש הצ'אק-בוקס על פי האי-די שלו
            CheckBox GameIsPublishCb = (CheckBox)row.FindControl("isPublishCB");
            
            countLable.Text = quest.Count.ToString();
            if (quest.Count >= 10)
            {
                GameIsPublishCb.Enabled = true;
                countLable.CssClass = "black";
                ((Panel)row.FindControl("tooltipPanel")).CssClass = "";
                ((Label)row.FindControl("toolTipLable")).Visible = false;

            }
            else
            {
                GameIsPublishCb.Enabled = false;
                //אם מקודם המשחק היה מפורסם, אנחנו רוצים להחזיר אותו ללא מפורסם בעץ
                XmlNode IsPublish = xmlDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]");
                IsPublish.Attributes["editorPublish"].InnerText = "False";
                XmlDataSource1.Save();

                //וגם לשנות את הפקד עצמו ללא לחוץ
                GameIsPublishCb.Checked = false;
                countLable.CssClass = "red";

                //הפעלת האפשרות להציג טולטיפ במעבר עכבר
                ((Panel)row.FindControl("tooltipPanel")).CssClass = "tooltip";
               // ((Label)row.FindControl("publishToolTip")).Visible = true;


            }




        }
    }

    protected void Button1_Click(object sender, EventArgs e)//הוספת משחק חדש
    {
        //טעינת העץ//
        XmlDocument myDoc = XmlDataSource1.GetXmlDocument();
        // הקפצה של מונה האי די בתוך קובץ האקס אם אל באחד
        int myId = Convert.ToInt16(myDoc.SelectSingleNode("//idCounter").InnerXml);
        myId++;

        string myNewId = myId.ToString();
        myDoc.SelectSingleNode("//idCounter").InnerXml = myNewId;
        //אטריביוטים //
        XmlElement newGame = myDoc.CreateElement("game");
        newGame.SetAttribute("editorPublish", "false");
        newGame.SetAttribute("gameCode", myNewId);
        newGame.SetAttribute("Counter", "0");
        //שם המשחק //
        XmlElement gameName = myDoc.CreateElement("gameName");
        gameName.InnerText = Server.UrlEncode(TextBox1.Text);
        newGame.AppendChild(gameName);
        //הנחיה //
        XmlElement instr = myDoc.CreateElement("gameInstruction");
        instr.InnerText = Server.UrlEncode("התאם בין הפריטים על הלוח על ידי יצירת מסלול");
        newGame.AppendChild(instr);

        //couples ענף //
        XmlElement couples = myDoc.CreateElement("couples");// זוגות ענף הוספת        
        newGame.AppendChild(couples);
        //ענף couple
        XmlElement couple = myDoc.CreateElement("couple");
        string id = 0.ToString();
        couple.SetAttribute("id", id);



        myDoc.SelectSingleNode("/project").AppendChild(newGame);
        myDoc.Save(Server.MapPath("tree/XMLFile1.xml"));

        XmlNode FirstGame = myDoc.SelectNodes("/project/game").Item(0);
        myDoc.SelectSingleNode("/project").InsertBefore(newGame, FirstGame);
        XmlDataSource1.Save();
        GridView1.DataBind();
        checkBoxAble();
        TextBox1.Text = "";
    }
}
