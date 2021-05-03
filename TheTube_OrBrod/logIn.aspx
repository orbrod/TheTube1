<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logIn.aspx.cs" Inherits="logIn" %>

<!DOCTYPE html>




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TheTube_logIn</title>

        <!-- CSS -->

    <link href="styles/StyleSheet2.css" rel="stylesheet" />

    
    <!-- Scripts -->
    <!--jQuery library-->
    <script src="jScripts/jquery-1.12.0.min.js"></script>
    <!--הקוד שמפעיל את תפריט הניווט-->
    <script src="jScripts/myScript.js"></script>
     <link rel="icon" type="image/png" href="images/theTebu_newLogo-02.png" />
<%--    <script src="scripts/jsLogIn.js"></script>--%>
    <script src="scripts/jquery-1.12.0.min.js"></script>
    <link href="styles/logInStyle.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server" style="direction: rtl">

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



        <div id="container">
            <div id="logo2"></div><br />
            <div class="itemsDiv">
            <asp:Label ID="userNameLbl" runat="server" Text="שם משתמש:"></asp:Label><br />
            <asp:TextBox ID="userName" runat="server"></asp:TextBox><br /><br />
            <asp:Label ID="Label1" runat="server" Text="סיסמא:"></asp:Label><br />
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox><br /><br />
            <asp:Button ID="submit" runat="server" Text="כניסה" OnClick="submit_Click" /><br /><br />
            <asp:Label ID="massege" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="massege2" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="nameandpass" runat="server" Text="שם משתמש: admin סיסמא: telem"></asp:Label>
                </div>
        </div>
    </form>
</body>
</html>
