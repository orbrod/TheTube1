
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Edit : System.Web.UI.Page
{
    string imagesLibPath = "uploadedFiles/";

   

    protected void page_init(object sender, EventArgs e)
    {
   
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        deleteLbl.Text = "אתה עומד למחוק את הזוג הזה";
        XmlDocument mydoc = XmlDataSource1.GetXmlDocument();
        string GameCode = Session["GameIDSession"].ToString();
     
      
        if (GameCode != null)
        {
            if (Page.IsPostBack == false)
            {

                Button11.Style["visibility"] = "hidden";
                deletePanel.Visible = false;
                grayBack.Visible = false;
                changeItem1.Value = "false";
                changeItem2.Value = "false";
                HiddenField2.Value = "";
                HiddenField1.Value = "";
                changePic1.Value = "false";
                changePic2.Value = "false";
                TextBox7.Style["visibility"] = "hidden";
                TextBox8.Style["visibility"] = "hidden";
                QuestLbl.Style["visibility"] = "hidden";
                QuestLbl2.Style["visibility"] = "hidden";
                chooseFile1.Style["visibility"] = "hidden";
                chooseFile2.Style["visibility"] = "hidden";
                picture.Style["visibility"] = "hidden";
                picture2.Style["visibility"] = "hidden";

            }
            //כאן נרשום את השאילתה החדשה לתוך רכיב ה- XmlDataSource
            //על מנת שהשאלות יהיו מותאמות למשחק שבחרנו
            XmlDataSource1.XPath = "/project/game[@gameCode=" + GameCode + "]/couples/couple";
            
            XmlNode myGame = mydoc.SelectSingleNode("/project/game[@gameCode=" + GameCode + "]/gameName");

            Label1.Text = Server.UrlDecode(myGame.InnerText);
            XmlNode myCount = mydoc.SelectSingleNode("/project/game[@gameCode=" + GameCode + "]");
            
            int counter = Convert.ToInt32(myCount.Attributes["Counter"].Value);
            countGrid.Text = counter.ToString();
            if (counter == 0)
            {
                explainPanel.CssClass = "";
            }
            if (counter < 10)
            {
                countGrid.CssClass = "red";
            }
            else
            {
                countGrid.CssClass = "black";
            }

            foreach (GridViewRow gvr in GridView2.Rows)
            {




                string coupleId = ((ImageButton)gvr.FindControl("editRow")).Attributes["theItemId"].ToString();
                XmlNode item1 = mydoc.SelectSingleNode("/project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + coupleId + "]/item[1]");
                XmlNode item2 = mydoc.SelectSingleNode("/project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + coupleId + "]/item[2]");
                string fileType1 = item1.Attributes["fileType"].Value;
                string fileType2 = item2.Attributes["fileType"].Value;
                if (fileType1 == "pic")
                {
                    ((Image)(gvr.FindControl("item1Img"))).Visible = true;
                    
                }
                else
                {
                    ((Label)(gvr.FindControl("item1"))).Visible = true;
                    
                }
                if (fileType2 == "pic")
                {
                    ((Image)(gvr.FindControl("item2Img"))).Visible = true;
                    
                }
                else
                {
                    ((Label)(gvr.FindControl("item2"))).Visible = true;
                    
                }
            }

        }
        else
        {
            Response.Redirect("gamesTable.aspx");//במידה ועבר זמן רב מידי המשתמש נזרק בחזרה לעמוד טבלת משחקים
        }
    
    }



    protected void XmlDataSource1_Transforming(object sender, EventArgs e)
    {
    }

    protected void grid ()
    {
        XmlDocument mydoc = XmlDataSource1.GetXmlDocument();
        string GameCode = Session["GameIDSession"].ToString();

        foreach (GridViewRow gvr in GridView2.Rows)
        {




            string coupleId = ((ImageButton)gvr.FindControl("editRow")).Attributes["theItemId"].ToString();
            XmlNode item1 = mydoc.SelectSingleNode("/project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + coupleId + "]/item[1]");
            XmlNode item2 = mydoc.SelectSingleNode("/project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + coupleId + "]/item[2]");
            string fileType1 = item1.Attributes["fileType"].Value;
            string fileType2 = item2.Attributes["fileType"].Value;
            if (fileType1 == "pic")
            {
                ((Image)(gvr.FindControl("item1Img"))).Visible = true;

            }
            else
            {
                ((Label)(gvr.FindControl("item1"))).Visible = true;

            }
            if (fileType2 == "pic")
            {
                ((Image)(gvr.FindControl("item2Img"))).Visible = true;

            }
            else
            {
                ((Label)(gvr.FindControl("item2"))).Visible = true;

            }
        }

    }


    protected void addPicItem1()//הוספת תמונה פריט 1
    {

        string fileType = FileUpload1.PostedFile.ContentType;


        if (fileType.Contains("image"))
        {
            //שמירת הנתיב המלא של הקובץ             
            string fileName = FileUpload1.PostedFile.FileName;
            // הסיומת של הקובץ             
            string endOfFileName = fileName.Substring(fileName.LastIndexOf("."));
            //מתן זמן לתמונה למניעת כפילות             
            string myTime = DateTime.Now.ToString("dd_MM_yy-HH_mm_ss");
            // חיבור השם החדש עם הזמן והסיומת של הקובץ             
            string imageNewName = "imageNewName1" + myTime + endOfFileName;
            //שמירה של הקובץ לספרייה בשם החדש שלו             
            //FileUpload2.PostedFile.SaveAs(Server.MapPath(imagesLibPath) + imageNewName);

            //Bitmap המרת הקובץ שיתקבל למשתנה מסוג
            System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);

            //קריאה לפונקציה המקטינה את התמונה
            //אנו שולחים לה את התמונה שלנו בגירסאת הביטמאפ ואת האורך והרוחב שאנו רוצים לתמונה החדשה
            System.Drawing.Image objImage = FixedSize(bmpPostedImage, 200, 200);



            //שמירת הקובץ בגודלו החדש בתיקייה
            objImage.Save(Server.MapPath(imagesLibPath) + imageNewName);
            //הצגה של הקובץ החדש מהספרייה
            ((Image)FindControl("Image1")).ImageUrl = imagesLibPath + imageNewName;
            //Image1.ImageUrl = imagesLibPath + imageNewName;
            //הוספת שם התמונה לעץ

            Session["fileType1"] = "pic";
            Session["contentItem1"] = imageNewName;

        }
        else
        {
            //הודעה שהקובץ לא מתאים
        }

    }

    protected void addPic2()//הוספת תמונה פריט 2
    {
        string fileType = FileUpload2.PostedFile.ContentType;
        if (fileType.Contains("image"))
        {
            //שמירת הנתיב המלא של הקובץ             
            string fileName = FileUpload2.PostedFile.FileName;
            // הסיומת של הקובץ             
            string endOfFileName = fileName.Substring(fileName.LastIndexOf("."));
            //מתן זמן לתמונה למניעת כפילות             
            string myTime = DateTime.Now.ToString("dd_MM_yy-HH_mm_ss");
            // חיבור השם החדש עם הזמן והסיומת של הקובץ             
            string imageNewName = "imageNewName2" + myTime + endOfFileName;
            //שמירה של הקובץ לספרייה בשם החדש שלו             
            //FileUpload1.PostedFile.SaveAs(Server.MapPath(imagesLibPath) + imageNewName);

            //Bitmap המרת הקובץ שיתקבל למשתנה מסוג
            System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(FileUpload2.PostedFile.InputStream);

            //קריאה לפונקציה המקטינה את התמונה
            //אנו שולחים לה את התמונה שלנו בגירסאת הביטמאפ ואת האורך והרוחב שאנו רוצים לתמונה החדשה
            System.Drawing.Image objImage = FixedSize(bmpPostedImage, 200, 200);



            //שמירת הקובץ בגודלו החדש בתיקייה
            objImage.Save(Server.MapPath(imagesLibPath) + imageNewName);//הצגה של הקובץ החדש מהספרייה
            ((Image)FindControl("Image2")).ImageUrl = imagesLibPath + imageNewName;
            //Image2.ImageUrl = imagesLibPath + imageNewName;
            //הוספת שם התמונה לעץ

            Session["fileType2"] = "pic";
            Session["contentItem2"] = imageNewName;

        }
        else
        {
            //הודעה שהקובץ לא מתאים
        }
    }





    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void editRow(object sender, GridViewCommandEventArgs e)
    {
        // תחילה אנו מבררים מהו ה -אי די- של הפריט בעץ ה אקס אם אל
        ImageButton i = (ImageButton)e.CommandSource;
        //שימוש במשתנה סשן על מנת לשמור את המשתנה בין דפים
        Session["CoupleIDSession"] = i.Attributes["theItemId"];

        switch (e.CommandName)
        {
            //אם נלחץ על כפתור מחיקה יקרא לפונקציה של מחיקה                    
            case "deleteRow":
                deleteRow();
                break;

            //אם נלחץ על כפתור עריכה (העפרון) נעבור לדף עריכה                    
            case "editRow":

                editRow();
                break;
        }


    }

    protected void editRow()//הצגת הפריטים לאחר לחיצה על כפתור עריכה
    {
        //הסרת כתפור טען זוג והצגת כפתור שמירת שינויים
        Button11.Style["visibility"] = "visible";
        Button6.Style["visibility"] = "hidden";
            
        
        //Image1.CssClass = "hidden";
        //Image2.CssClass = "hidden";
        Image1.Style["visibility"] = "hidden";
        Image2.Style["visibility"] = "hidden";

        //החזרה של כל הכפתורים לצבע המקורי
        Button1.CssClass = "noFill";
        Button2.CssClass = "noFill";
        Button3.CssClass = "noFill";
        Button8.CssClass = "noFill";

        // אנו מושכים את האי די של הפריט באמצעות מאפיין לא שמור במערכת שהוספנו באופן ידני לכפתור-תמונה
        string theId = Session["CoupleIDSession"].ToString();
        string GameCode = Session["GameIDSession"].ToString();
        XmlDocument myDoc = XmlDataSource1.GetXmlDocument();
        XmlNode fileType1= myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + theId + "]/item[1]"); ;
        string fileTypeItem1= fileType1.Attributes["fileType"].Value; ;
        XmlNode fileType2 = myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + theId + "]/item[2]");
        string fileTypeItem2= fileType2.Attributes["fileType"].Value; 
        if (fileTypeItem1 == "txt")
        {
            Image1.Style["visibility"] = "hidden";
            TextBox7.Text = Server.UrlDecode(fileType1.InnerText);
            QuestLbl.Text = TextBox7.Text.Length + "/16";
            TextBox7.Style["visibility"] = "visible";
            QuestLbl.Style["visibility"] = "visible";
            HiddenField1.Value = "txt";
            Button1.CssClass = "green";
        }
       else if(fileTypeItem1=="pic")
        {
            TextBox7.Style["visibility"] = "hidden";
            QuestLbl.Style["visibility"] = "hidden";
            picture.Style["visibility"] = "visible";
            XmlNode imageName1 = myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + theId + "]/item[1]");
            string imageName = imageName1.InnerText;
            Image1.ImageUrl = "~/uploadedFiles/" + imageName + "";
            Button2.CssClass = "green";
            HiddenField1.Value = "pic";
            //Image1.CssClass = "imageCss";
            Image1.Style["visibility"] = "visible";
            chooseFile1.Style["visibility"] = "visible";
        }
        
        if (fileTypeItem2 == "txt")
        {
            //Image2.CssClass = "hidden";
            Image2.Style["visibility"] = "hidden";
            TextBox8.Text = Server.UrlDecode(fileType2.InnerText);
            QuestLbl2.Text = TextBox8.Text.Length + "/16";
            TextBox8.Style["visibility"] = "visible";
            QuestLbl2.Style["visibility"] = "visible";
            Button3.CssClass = "green";
            HiddenField2.Value = "txt";
        }
       else if(fileTypeItem2=="pic")
        {
            TextBox8.Style["visibility"] = "hidden";
            QuestLbl2.Style["visibility"] = "hidden";
            picture2.Style["visibility"] = "visible";
            XmlNode imageName2 = myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + theId + "]/item[2]");
            string imageName = imageName2.InnerText;
            Image2.ImageUrl = "~/uploadedFiles/" + imageName + "";
            Button8.CssClass = "green";
            //Image2.CssClass = "imageCss";
            Image2.Style["visibility"] = "visible";
            chooseFile2.Style["visibility"] = "visible";
            HiddenField2.Value = "pic";
        }
    }

    protected void deleteRow()//הצגת פאנל מחיקה
    {
        TextBox7.Style["visibility"] = "hidden";
        TextBox8.Style["visibility"] = "hidden";
        //Image1.CssClass = "hidden";
        //Image2.CssClass = "hidden";
        Image1.Style["visibility"] = "hidden";
        Image2.Style["visibility"] = "hidden";

        //כרגע ללא בקרה!
        deletePanel.Visible = true;
        grayBack.Visible = true;
        //הסרת ענף של משחק קיים באמצעות זיהוי האיי דיי שניתן לו על ידי לחיצה עליו מתוך הטבלה
        //שמירה ועדכון לתוך העץ ולגריד ויו
        string CoupleIdToDelete = Session["CoupleIDSession"].ToString();
        string GameCode = Session["GameIDSession"].ToString();
        XmlDocument Document = XmlDataSource1.GetXmlDocument();
        XmlNode item1 = Document.SelectSingleNode("project / game[@gameCode = " + GameCode + "] / couples / couple[@id = " + CoupleIdToDelete + "]/item[1]");
        XmlNode item2 = Document.SelectSingleNode("project / game[@gameCode = " + GameCode + "] / couples / couple[@id = " + CoupleIdToDelete + "]/item[2]");
        string fileType1 = item1.Attributes["fileType"].Value;
        string fileType2 = item2.Attributes["fileType"].Value;
        if (fileType1 == "txt")
        {
            deleteTxt1.Visible = true;
            deleteTxt1.Text = Server.UrlDecode(item1.InnerText);
            Image4.Visible = false;
        }
        else
        {
            deleteTxt1.Visible = false;
            Image4.Visible = true;
            Image4.ImageUrl = "~/uploadedFiles/" + item1.InnerText + "";
        }
        if (fileType2 == "txt")
        {
            deleteTxt2.Visible = true;
            deleteTxt2.Text = Server.UrlDecode(item2.InnerText);
            Image5.Visible = false;
        }
        else
        {
            deleteTxt2.Visible = false;
            Image5.Visible = true;
            Image5.ImageUrl = "~/uploadedFiles/" + item2.InnerText + "";
        }
    }

    protected void Button11_Click(object sender, EventArgs e)//שמור שינויים
    {
        // אנו מושכים את האי די של הפריט באמצעות מאפיין לא שמור במערכת שהוספנו באופן ידני לכפתור-תמונה
        string theId = Session["CoupleIDSession"].ToString();
        string GameCode = Session["GameIDSession"].ToString();
        
        XmlDocument myDoc = XmlDataSource1.GetXmlDocument();
        XmlNode item1 = myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + theId + "]/item[1]");
        XmlNode item2 = myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples/couple[@id=" + theId + "]/item[2]");
        string fileType1 = item1.Attributes["fileType"].Value;
        string fileType2 = item2.Attributes["fileType"].Value;
        if (changeItem1.Value == "true")
        {

            item1.Attributes["fileType"].Value = HiddenField1.Value;
            XmlDataSource1.Save();
            if (HiddenField1.Value == "pic" && changePic1.Value == "true")
            {
                addPicItem1();
                item1.InnerText = Session["contentItem1"].ToString();
            }
            if(HiddenField1.Value == "txt")
            {
                item1.InnerText = Server.UrlEncode(TextBox7.Text);
            }
        }
        else if(changeItem1.Value == "false")
        {
            if (fileType1 == "txt" && TextBox7.Text != item1.InnerText)
            {
                item1.InnerText = Server.UrlEncode(TextBox7.Text);
            }
            if (fileType1 == "pic" && changePic1.Value=="true")
            {
                addPicItem1();
                item1.InnerText= Session["contentItem1"].ToString();
            }
           
        }

        if (changeItem2.Value == "true")
        {
            item2.Attributes["fileType"].Value = HiddenField2.Value;
            XmlDataSource1.Save();
            if (HiddenField2.Value == "pic" && changePic2.Value == "true")
            {
                addPic2();
                item2.InnerText = Session["contentItem2"].ToString();
            }
            if (HiddenField2.Value == "txt")
            {
                item2.InnerText = Server.UrlEncode(TextBox8.Text);
            }
        }
        else
        {
            if (fileType2 == "txt"&&item2.InnerText!=TextBox8.Text)
            {
                item2.InnerText = Server.UrlEncode(TextBox8.Text);
            }
            if (fileType2 == "pic" && changePic2.Value=="true")
            {
                addPic2();
                item2.InnerText = Session["contentItem2"].ToString();
            }
        }
        //שמירה
        XmlDataSource1.Save();
        GridView2.DataBind();
        grid();
        //איפוס משתנים והחזרת עיצוב
        backToNormal();




    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("gamesTable.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)//טען זוג
    {
        //בלחיצה על טען זוג מתווסף זוג חדש למשחק
        //לעשות בדיקה האם זה טקסט או תמונה ולהציג בהתאם
        XmlDocument myDoc = XmlDataSource1.GetXmlDocument();
        string GameCode = Session["GameIDSession"].ToString();
        //בירור מהו האי די הנוכחי והקפצתו ב1
        
        XmlNode node = myDoc.SelectNodes("project/game[@gameCode=" + GameCode + "]/couples/couple").Item(0);
        int coupleId;
        if (node == null)
        {
            coupleId = 1;
            explainPanel.CssClass = "hidden";
        }
        else
        {
            coupleId = Convert.ToInt32(node.Attributes["id"].Value);
            coupleId++;
        }
        
        XmlElement couple = myDoc.CreateElement("couple");
        couple.SetAttribute("id", coupleId.ToString());
        XmlElement item1 = myDoc.CreateElement("item");
        
    
        if (HiddenField1.Value=="txt")
        {
            item1.SetAttribute("fileType", "txt");
            item1.InnerText = Server.UrlEncode(TextBox7.Text);



        }
        else
        {
            addPicItem1();
            item1.SetAttribute("fileType", "pic");
            item1.InnerText = Session["contentItem1"].ToString();
        }
        
        couple.AppendChild(item1);
        XmlElement item2 = myDoc.CreateElement("item");

        
        if (HiddenField2.Value=="txt")
        {
            item2.SetAttribute("fileType", "txt");
            item2.InnerText = Server.UrlEncode(TextBox8.Text);
        }
        else
        {
            addPic2();
            item2.SetAttribute("fileType", "pic");
            item2.InnerText = Session["contentItem2"].ToString();
        }
       
        
        couple.AppendChild(item2);
        XmlNode firstCouple = myDoc.SelectNodes("project/game[@gameCode=" + GameCode + "]/couples/couple").Item(0);
        myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples").AppendChild(couple);
        myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]/couples").InsertBefore(couple,firstCouple);
      
      //ספירת זוגות 
        XmlNodeList quest = myDoc.SelectNodes("project/game[@gameCode=" + GameCode + "]/couples/couple");
        XmlNode countCouple = myDoc.SelectSingleNode("project/game[@gameCode=" + GameCode + "]");
        int coupleNum = quest.Count;
        countCouple.Attributes["Counter"].Value = coupleNum.ToString();       
   
        //הלייבל שמעל הגריד
        countGrid.Text = coupleNum.ToString();
        if (coupleNum < 10)
        {
            countGrid.CssClass = "red";
        }
        else
        {
            countGrid.CssClass = "black";
        }

    
        //שמירה
        myDoc.Save(Server.MapPath("tree/XMLFile1.xml"));
        GridView2.DataBind();
        grid();
        //איפוס משתנים והחזרת עיצוב
        backToNormal();

    }

    protected void Button12_Click(object sender, EventArgs e)//מחיקה לאחר לחיצה על אישור
    {
        //הסרת ענף של משחק קיים באמצעות זיהוי האיי דיי שניתן לו על ידי לחיצה עליו מתוך הטבלה
        //שמירה ועדכון לתוך העץ ולגריד ויו
        string CoupleIdToDelete = Session["CoupleIDSession"].ToString();
        string GameCode = Session["GameIDSession"].ToString();
        XmlDocument Document = XmlDataSource1.GetXmlDocument();
        XmlNode node = Document.SelectSingleNode("project / game[@gameCode = " + GameCode + "] / couples / couple[@id = " + CoupleIdToDelete + "]");
        node.ParentNode.RemoveChild(node);
        XmlNodeList quest = Document.SelectNodes("project/game[@gameCode=" + GameCode + "]/couples/couple");
        XmlNode countCouple = Document.SelectSingleNode("project/game[@gameCode=" + GameCode + "]");
        int coupleNum = quest.Count;
        countCouple.Attributes["Counter"].Value = coupleNum.ToString();
        XmlDataSource1.Save();
        GridView2.DataBind();
        grid();
        deletePanel.Visible = false;
        grayBack.Visible = false;
        Image4.ImageUrl = "";
        Image5.ImageUrl = "";
        deleteTxt1.Text = "";
        deleteTxt2.Text = "";

        if (coupleNum < 10)
        {
            countGrid.CssClass = "red";
        }
        else
        {
            countGrid.CssClass = "black";
        }
        countGrid.Text = countCouple.Attributes["Counter"].Value;
        if (coupleNum == 0)
        {
            explainPanel.CssClass = "";
        }
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        deletePanel.Visible = false;
        grayBack.Visible = false;
        Image4.ImageUrl = "";
        Image5.ImageUrl = "";
        deleteTxt1.Text = "";
        deleteTxt2.Text = "";
    }

    // פונקציה המקבלת את התמונה שהועלתה , האורך והרוחב שאנו רוצים לתמונה ומחזירה את התמונה המוקטנת
    static System.Drawing.Image FixedSize(System.Drawing.Image imgPhoto, int Width, int Height)
    {
        int sourceWidth = Convert.ToInt32(imgPhoto.Width);
        int sourceHeight = Convert.ToInt32(imgPhoto.Height);

        int sourceX = 0;
        int sourceY = 0;
        int destX = 0;
        int destY = 0;

        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)Width / (float)sourceWidth);
        nPercentH = ((float)Height / (float)sourceHeight);
        if (nPercentH < nPercentW)
        {
            nPercent = nPercentH;
            destX = System.Convert.ToInt16((Width -
                          (sourceWidth * nPercent)) / 2);
        }
        else
        {
            nPercent = nPercentW;
            destY = System.Convert.ToInt16((Height -
                          (sourceHeight * nPercent)) / 2);
        }

        int destWidth = (int)(sourceWidth * nPercent);
        int destHeight = (int)(sourceHeight * nPercent);

        System.Drawing.Bitmap bmPhoto = new System.Drawing.Bitmap(Width, Height,
                          System.Drawing.Imaging.PixelFormat.Format24bppRgb);
        bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
                         imgPhoto.VerticalResolution);

        System.Drawing.Graphics grPhoto = System.Drawing.Graphics.FromImage(bmPhoto);
        grPhoto.Clear(System.Drawing.Color.White);
        grPhoto.InterpolationMode =
                System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

        grPhoto.DrawImage(imgPhoto,
            new System.Drawing.Rectangle(destX, destY, destWidth, destHeight),
            new System.Drawing.Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
            System.Drawing.GraphicsUnit.Pixel);

        grPhoto.Dispose();
        return bmPhoto;
    }
    protected void back_Click(object sender, ImageClickEventArgs e)//חזרה לטבלת המשחקים 
    {
        Response.Redirect("gamesTable.aspx");
    }
    protected void backToNormal()
    {
        //איפוס כל המשתנים והחזרת הכפתורים לצבע הרגיל
        changeItem1.Value = "false";
        changeItem2.Value = "false";
        changePic1.Value = "false";
        changePic2.Value = "false";
        HiddenField2.Value = "";
        HiddenField1.Value = "";
        chooseFile1.Style["visibility"] = "hidden";
        chooseFile2.Style["visibility"] = "hidden";
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox7.Style["visibility"] = "hidden";
        TextBox8.Style["visibility"] = "hidden";
        Image1.CssClass = "imageCss";
        Image2.CssClass = " imageCss";
        Image1.Style["visibility"] = "hidden";
        Image2.Style["visibility"] = "hidden";
        Button11.Style["visibility"] = "hidden";
        Button6.Style["visibility"] = "visible";
        Button1.CssClass = "noFill";
        Button2.CssClass = "noFill";
        Button3.CssClass = "noFill";
        Button8.CssClass = "noFill";
        Image1.ImageUrl = "";
        Image2.ImageUrl = "";
        Session["contentItem1"] = "";
        Session["contentItem2"] = "";
        //איפוס ספירת תווים והסתרה
        QuestLbl.Text = "0/16";
        QuestLbl2.Text = "0/16";
        QuestLbl.Style["visibility"] = "hidden";
        QuestLbl2.Style["visibility"] = "hidden";
        picture.Style["visibility"] = "hidden";
        picture2.Style["visibility"] = "hidden";
    }
}