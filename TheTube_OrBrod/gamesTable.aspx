<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gamesTable.aspx.cs" Inherits="gamesTable" %>

<!DOCTYPE html>

<link href="styles/StyleSheet.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Heebo&display=swap" rel="stylesheet">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TheTube_gamesTable</title>

    
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
     <%--<script src="scripts/JavaScript.js"></script>--%>
    <script src="scripts/jsGameTable.js"></script>
    <style type="text/css">
        .Grid {}
    </style>
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
                <div id="meholel" style="direction: rtl" class="container">
                   <h1>המשחקים שלי</h1>

                
                    <br />
                    <div id="gameName">שם המשחק:</div><br /><asp:TextBox ID="TextBox1" runat="server" CharacterLimit="60" CharacterForLabel="QuestLbl3" CssClass="CharacterCount" MaxLength="60"></asp:TextBox> <asp:Label ID="QuestLbl3" runat="server" Text="0/60"></asp:Label>  
                    <asp:Button ID="ButtonAdd" runat="server" Text="צור משחק" OnClick="Button1_Click" CssClass="buttonNotAble" /> 
                    &nbsp;<br />
                    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/XMLFile1.xml" XPath="/project/game"></asp:XmlDataSource>
                    <div id="mainTable" class="Grid">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" OnRowCommand="GridView1_RowCommand" Width="1259px"  CssClass="gridDirection">
                        <Columns>
                           <asp:TemplateField HeaderText="שם המשחק">
                                <ItemTemplate>
                                    <asp:Label ID="GameNameLbl" runat="server" Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "gameName").ToString())%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="קוד משחק" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="gameCodeLbl" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "@gameCode").ToString()%>' ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="הגדרות">
                             <ItemTemplate>
                                    <asp:ImageButton ID="setBtn" runat="server" CommandName="setRow" ImageUrl="~/images/settings.png" theItemId='<%#XPathBinder.Eval(Container.DataItem, "@gameCode").ToString()%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="מספר זוגות"  ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="CoupleCount" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "@Counter").ToString()%>' CssClass="red"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="עריכה">
                                <ItemTemplate>
                                    <asp:ImageButton ID="editBtn"   runat="server" CommandName="editRow" ImageUrl="~/images/pancil.png" theItemId='<%#XPathBinder.Eval(Container.DataItem, "@gameCode").ToString()%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="מחיקה">
                                <ItemTemplate>
                                    <asp:ImageButton ID="deleteBtn" runat="server" CommandName="deleteRow" ImageUrl="~/images/trash.png" theItemId='<%#XPathBinder.Eval(Container.DataItem, "@gameCode").ToString()%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="פרסום">
                                <ItemTemplate>
                                    <asp:Panel  ID="toolTipPanel" CssClass="" runat="server">
                                        <label class="switch">
                                   <asp:CheckBox ID="IsPublishCB" AutoPostBack="true" OnCheckedChanged="IsPublishCB_CheckedChanged"  runat="server" Checked='<%#Convert.ToBoolean(XPathBinder.Eval(Container.DataItem,"@editorPublish"))%>' theItemId='<%#XPathBinder.Eval(Container.DataItem,"@gameCode")%>' />
 <span class="slider round"></span>
                                    </label>
                                         <asp:Label ID="toolTipLable" runat="server" Text="" CssClass="tooltiptext">כדי לפרסם עליך להיכנס לעריכה וליצור מינ' 10 זוגות</asp:Label>
                                        
                                        </asp:Panel>
                                    <!-- Rounded switch -->
                                     

                                     


                                    </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                        </div>
                    <asp:Panel ID="grayBack" runat="server" Visible="false">
                    <asp:Panel ID="deletePanel" runat="server" style="direction: rtl; margin-right: 0px; background-color: #FFFFFF" Width="500px" Height="200px">
                        <asp:Label ID="mainDel" runat="server"></asp:Label>
                        <br />
                <br />
                        <asp:Label ID="gameNameToDel" runat="server"></asp:Label>
                <br />
                        <br />
                        <asp:Button ID="yesDelete" CssClass="deleteBtn" runat="server" OnClick="yesDelete_Click" Text="מחק" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="noDelete" runat="server" CssClass="deleteBtn" OnClick="noDelete_Click" Text="ביטול" />
                    </asp:Panel>
                        </asp:Panel>
                    </div>
                
            </form>
        
    </body>
</html>
