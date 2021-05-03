<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TheTube_edit</title>

    <!-- CSS -->
    <link href="styles/StyleSheet3.css" rel="stylesheet" />

    <!-- Scripts -->
    <!--jQuery library-->
    <script src="jScripts/jquery-1.12.0.min.js"></script>
    <!--הקוד שמפעיל את תפריט הניווט-->
    <script src="jScripts/myScript.js"></script>
     <link rel="icon" type="image/png" href="images/theTebu_newLogo-02.png" />

    <%--הפניה לקובץ jquary--%>
    <script src="scripts/jquery-1.12.0.min.js"></script>
    <%--הפניה לקובץ JS שלנו--%>
     <script src="scripts/JavaScript.js"></script>

    <link href="styles/StyleSheet.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Heebo&display=swap" rel="stylesheet">
</head>
<body style="direction: rtl">
    <form id="form1" runat="server">


         <header>
            <!--קישור לדף עצמו כדי להתחיל את המשחק מחדש בלחיצה על הלוגו-->
            <a href="indextest.html">

               <img id="logo" src="images/theTebu_newLogo-02.png" />


                <p>The Tube</p>
            </a>
            <!--תפריט הניווט בראש העמוד-->
            <nav>
                <ul>

                     <li><a href="index.html">למשחק</a></li>
                    <li><a class="about">אודות</a></li>
                    <li><a class="howToPlay">איך משחקים?</a></li>
                </ul>
            </nav>
        </header>
        <div id="aboutDiv" class="popUp bounceInDown hide">
            <a class="closeAbout">X</a>
            <p>
                אפיון ופיתוח: אור ברוד וענבר קוקוי
                <br />
                אופיון ופותח במסגרת פרוייקט בקורסים:
                <br />
                סביבות לימוד אינטראקטיביות 2 + תכנות אינטראקטיבי 2+ תכנות 2
                <br />
                תש"פ
                <br />
                <img id="logoHIT" src="images/50 logo HIT-01.png" />
                <br />
                <a href="https://www.hit.ac.il/telem/overview"> הפקולטה לטכנולוגיות למידה</a>
                <br />
                המכון הטכנולוגי חולון
            </p>
        </div>
        <div id="howToPlayDiv" class="popUp bounceInDown hide">
            <a  class="closeHowToPlay">X</a>
            <!--<p>כאן יכנסו התמונות/הסרטון המסביר כיצד לשחק</p>-->
            <iframe id="movie" width="560" height="315" src="https://www.youtube.com/embed/bNQFBK9sesM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>



        <div style="direction: rtl" class="container">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <asp:HiddenField ID="changeItem1" runat="server" />
            <asp:HiddenField ID="changeItem2" runat="server" />
            <asp:HiddenField ID="changePic1" runat="server" />
            <asp:HiddenField ID="changePic2" runat="server" />
            &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
            <%--<div id="conectLine"></div>--%>
            <asp:ImageButton ID="back"  runat="server" ImageUrl="~/images/backArrow.png" Height="50px" OnClick="back_Click" Width="50px" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="editCon" runat="server" Text="עריכת תוכן"></asp:Label>
            
            <asp:Label ID="picture" runat="server" Text="" CssClass="explainLbl">קבצי JPEG, PNG, GIF  בלבד</asp:Label><asp:Label ID="picture2" runat="server" Text="" CssClass="explainLbl">קבצי JPEG, PNG, GIF  בלבד</asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="item1Lbl" runat="server" Text="פריט1"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="item2Lbl" runat="server" Text="פריט2 "></asp:Label>
            &nbsp;&nbsp;&nbsp; </strong>
            <br />
            <asp:Button ID="Button1" runat="server"  Text="טקסט " CssClass="buttons" OnClientClick="onClickText1(); return false;" />
            <asp:Button ID="Button2" runat="server"  Text="תמונה" OnClientClick="onClickPic1(); return false;"  CssClass="buttons"  />
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:Button ID="Button3" runat="server" Text="טקסט" CssClass="buttons" OnClientClick="onClickText2(); return false;"  />
            <asp:Button ID="Button8" runat="server"  Text="תמונה" OnClientClick="onClickPic2(); return false;"   CssClass="buttons"/>
            
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;<asp:Label ID="text2" runat="server" CssClass="labels"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;<asp:Label ID="text1" runat="server" CssClass="labels"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="chooseFile1" runat="server" Text="בחר קובץ" OnClientClick="openFileUploader1(); return false;" CssClass="hidden choodeFile" />
            <asp:Button ID="chooseFile2" runat="server" Text="בחר קובץ" OnClientClick="openFileUploader2(); return false;" CssClass="hidden choodeFile"  />
            <asp:Panel ID="grayBack" runat="server">
            <asp:Panel ID="deletePanel" runat="server" style="margin-right: 0px; background-color: #ffffff;" Width="500px" Height="269px">
              <asp:Label ID="deleteLbl" runat="server" ></asp:Label><br />
                <div style="display: flex; align-items: center; justify-content: space-evenly; width:500px; margin-top:60px" >
                
                <asp:Label ID="deleteTxt1" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Label ID="deleteTxt2" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Image ID="Image4" runat="server" Height="100px" Width="100px" Visible="false" />
                <asp:Image ID="Image5" runat="server" Height="100px" Width="100px" Visible="false" />
                    </div>
                <asp:Button ID="deleteP" runat="server" OnClick="Button12_Click" Text="מחק" CssClass="deletePanelButton" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cancelP" runat="server" OnClick="Button13_Click" Text="ביטול" CssClass="deletePanelButton" />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </asp:Panel>
                </asp:Panel>
                
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;<div id="oval1" class="oval"></div><asp:TextBox ID="TextBox7" CharacterLimit="16" CharacterForLabel="QuestLbl" CssClass="CharacterCount"  runat="server" TextMode="MultiLine" MaxLength="16"  ></asp:TextBox> <asp:Label ID="QuestLbl" runat="server" Text="0/16"></asp:Label>
            &nbsp;&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" style="margin-right: 0px" Width="0px" />
            &nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<div class="oval"></div><asp:TextBox ID="TextBox8" runat="server" CharacterLimit="16" CharacterForLabel="QuestLbl2" CssClass="CharacterCount" MaxLength="16" TextMode="MultiLine" ></asp:TextBox><asp:Label ID="QuestLbl2" runat="server" Text="0/16"></asp:Label>
            &nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload2" runat="server" Width="0px"  />
            &nbsp;
            &nbsp;<br />
            <br />
            
            <asp:Image ID="Image1" runat="server" Width="100px" CssClass="imageCss"   />
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" Width="100px" CssClass="imageCss"  />
            
                
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="טען זוג" CssClass="buttonNotAble" /><asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="שמור שינויים" CssClass="buttonNotAble" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <div id="countNote">
            נשמרו
            <asp:Label ID="countGrid" runat="server"></asp:Label>
&nbsp;זוגות (מינימום 10 לפרסום)<br /></div>
            
            
             <div id="innerTable" class="GridIn">   
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" OnRowCommand="editRow" Width="500px" CssClass="gridDirection"  >
                <Columns>
                    <asp:TemplateField HeaderText="פריט 1">
                        <ItemTemplate>
                            <asp:Label ID="item1" runat="server" Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "item[1]").ToString())%>' Visible="false"  ></asp:Label>
                            <asp:Image ID="item1Img" runat="server" ImageUrl='<%#"uploadedFiles/"+XPathBinder.Eval(Container.DataItem, "item[1]".ToString())%>' Visible="false" Width="100px" Height="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="פריט 2">
                        <ItemTemplate>
                            <asp:Label ID="item2" runat="server" Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "item[2]").ToString())%>' Visible="false" ></asp:Label>
                            <asp:Image ID="item2Img" runat="server" ImageUrl='<%#"uploadedFiles/"+XPathBinder.Eval(Container.DataItem, "item[2]".ToString())%>' Visible="false" Width="100px" Height="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="עריכה">
                        <ItemTemplate>
                            <asp:ImageButton ID="editRow" runat="server" CommandName="editRow" ImageUrl="~/images/pancil.png" theItemId='<%#XPathBinder.Eval(Container.DataItem, "@id").ToString()%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="מחיקה">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="deleteRow" ImageUrl="~/images/trash.png" theItemId='<%#XPathBinder.Eval(Container.DataItem, "@id").ToString()%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                  </div>   
            <asp:Panel ID="explainPanel" CssClass="hidden" runat="server">זוגות שתוסיף למשחק יופיעו כאן</asp:Panel>
            
               
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/XMLFile1.xml" OnTransforming="XmlDataSource1_Transforming" XPath="/project/game/couples/couple"></asp:XmlDataSource>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        </div>
    </form>
    
</body>
</html>
