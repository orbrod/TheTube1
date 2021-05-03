<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="Defenitions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TheTube_settings</title>

    
        <!-- CSS -->

    <link href="styles/StyleSheet3.css" rel="stylesheet" />

    <!-- Scripts -->
    <!--jQuery library-->
    <script src="jScripts/jquery-1.12.0.min.js"></script>
    <!--הקוד שמפעיל את תפריט הניווט-->
    <script src="jScripts/myScript.js"></script>
     <link rel="icon" type="image/png" href="images/theTebu_newLogo-02.png" />
    <link href="styles/settingsStyle.css" rel="stylesheet" />
     <%--הפניה לקובץ jquary--%>
    <script src="scripts/jquery-1.12.0.min.js"></script>
    <%--הפניה לקובץ JS שלנו--%>
    <script src="scripts/jsSettings.js"></script>
</head>
<body>
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


        <div id="container" style="direction: rtl">
            <asp:Label ID="gameName" runat="server" Text=""></asp:Label>
            <asp:ImageButton ID="back" runat="server" ImageUrl="~/images/backArrow.png" OnClick="back_Click" />
            <br />
            <asp:Label ID="Label1" runat="server">הגדרות כלליות</asp:Label>
            <br />
            <br />
            <asp:Label ID="gameNameLbl" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CharacterLimit="60" CharacterForLabel="QuestLbl" CssClass="CharacterCount" MaxLength="60"></asp:TextBox><asp:Label ID="QuestLbl" runat="server" Text="0/60"></asp:Label>
            <br />
            <br />
            <asp:Label ID="instrLbl" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" CharacterLimit="60" CharacterForLabel="QuestLbl2" CssClass="CharacterCount" MaxLength="60"></asp:TextBox><asp:Label ID="QuestLbl2" runat="server" Text="0/60"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="שמור ועבור אל עריכת התוכן" OnClick="Button1_Click"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="שמור וחזור" OnClick="Button2_Click"  />
            <asp:Panel ID="grayBack" runat="server" Visible="false">
            <asp:Panel ID="goBack" runat="server" Visible="false">
                <asp:Label ID="Label2" runat="server" Text="השינויים שביצעת לא ישמרו האם אתה בטוח שאתה רוצה לצאת?"></asp:Label>
                <asp:Button ID="confirm" runat="server" Text="יציאה"  CssClass="panelBtns" OnClick="confirm_Click"  />
                <asp:Button ID="cancel" runat="server" Text="ביטול" CssClass="panelBtns" OnClick="cancel_Click"  />
                
            </asp:Panel>
                </asp:Panel>
        </div>
    </form>
</body>
</html>
