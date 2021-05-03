//כאשר העמוד נטען
$(document).ready(function () {
  
   
    document.getElementById("Button6").disabled = true;
    document.getElementById("Button11").disabled = true;

  
    
    //בהקלדה בתיבת הטקסט
    $(".CharacterCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".CharacterCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    });

    
    //פונקציה שמקבלת את תיבת הטקסט שבה מקלידים ובודקת את מספר התווים
    function checkCharacter(myTextBox) {
        checkIfFull(document.getElementById("HiddenField1").value, document.getElementById("HiddenField2").value);
        //משתנה למספר התווים הנוכחי בתיבת הטקסט
        var countCurrentC = myTextBox.val().length;

        //משתנה המכיל את מספר התווים שמוגבל לתיבה זו
        var CharacterLimit = myTextBox.attr("CharacterLimit");

        //בדיקה האם ישנה חריגה במספר התווים
        if (countCurrentC > CharacterLimit) {

            //מחיקת התווים המיותרים בתיבה
            myTextBox.val(myTextBox.val().substring(0, CharacterLimit));
            //עדכון של מספר התווים הנוכחי
            countCurrentC = CharacterLimit;

        }

        //משתנה המקבל את שם הלייבל המקושר לאותה תיבת טקסט 
        var LableToShow = myTextBox.attr("CharacterForLabel");
        
        //הדפסה כמה תווים הוקלדו מתוך כמה
        $("#" + LableToShow).text(countCurrentC + "/" + CharacterLimit);
    }

});

function checkIfFull(fileType1, fileType2) {//הגנות
    if (fileType1 == "txt" && fileType2 == "txt") {//שני הפריטים טקסט 
        if (document.getElementById("TextBox7").value.length > 0 && document.getElementById("TextBox8").value.length > 0) {
            document.getElementById("Button6").disabled = false;
            document.getElementById("Button11").disabled = false;
            document.getElementById("Button6").classList.remove("buttonNotAble");
            document.getElementById("Button11").classList.remove("buttonNotAble");
        }
        else {
            document.getElementById("Button6").disabled = true;
            document.getElementById("Button11").disabled = true;
            document.getElementById("Button6").classList.add("buttonNotAble");
            document.getElementById("Button11").classList.add("buttonNotAble");
        }
    }
    if (fileType1 == "pic" && fileType2 == "pic") {//שני הפריטים תמונה
        if (document.getElementById("Image1").src != "" && document.getElementById("Image2").src != "") {
            //console.log(isFileImage(document.getElementById("Image1" + "תמונה1")));
            //console.log(isFileImage(document.getElementById("Image2" + "תמונה2")));

            if (isFileImage(document.getElementById("Image1")) == true && isFileImage(document.getElementById("Image2")) == true) {

                document.getElementById("Button6").disabled = false;
                document.getElementById("Button11").disabled = false;
                document.getElementById("Button6").classList.remove("buttonNotAble");
                document.getElementById("Button11").classList.remove("buttonNotAble");
            }
            else{
                document.getElementById("Button6").disabled = true;
                document.getElementById("Button11").disabled = true;
                document.getElementById("Button6").classList.add("buttonNotAble");
                document.getElementById("Button11").classList.add("buttonNotAble");
            }
        }
        else {
            document.getElementById("Button6").disabled = true;
            document.getElementById("Button11").disabled = true;
            document.getElementById("Button6").classList.add("buttonNotAble");
            document.getElementById("Button11").classList.add("buttonNotAble");

        }
    }
    if (fileType1 == "pic" && fileType2 == "txt") {//פריט 1 תמונה פריט 2 טקסט
        if (document.getElementById("Image1").src != "" && document.getElementById("TextBox8").value.length > 0) {
            
            if (isFileImage(document.getElementById("Image1")) == true) {

                document.getElementById("Button6").disabled = false;
                document.getElementById("Button11").disabled = false;
                document.getElementById("Button6").classList.remove("buttonNotAble");
                document.getElementById("Button11").classList.remove("buttonNotAble");
            }
            else {
                
                document.getElementById("Button6").disabled = true;
                document.getElementById("Button11").disabled = true;
                document.getElementById("Button6").classList.add("buttonNotAble");
                document.getElementById("Button11").classList.add("buttonNotAble");
            }
            
        }
        else {
            document.getElementById("Button6").disabled = true;
            document.getElementById("Button11").disabled = true;
            document.getElementById("Button6").classList.add("buttonNotAble");
            document.getElementById("Button11").classList.add("buttonNotAble");
        }
    }
    if (fileType1 == "txt" && fileType2 == "pic") {//פריט 1 טקסט פריט 2 תמונה
        if (document.getElementById("Image2").src != "" && document.getElementById("TextBox7").value.length > 0) {
            if (isFileImage(document.getElementById("Image2")) == true) {
                document.getElementById("Button6").disabled = false;
                document.getElementById("Button11").disabled = false;
                document.getElementById("Button6").classList.remove("buttonNotAble");
                document.getElementById("Button11").classList.remove("buttonNotAble");
            }
            else {

                document.getElementById("Button6").disabled = true;
                document.getElementById("Button11").disabled = true;
                document.getElementById("Button6").classList.add("buttonNotAble");
                document.getElementById("Button11").classList.add("buttonNotAble");
            }

        }
        else {
            document.getElementById("Button6").disabled = true;
            document.getElementById("Button11").disabled = true;
            document.getElementById("Button6").classList.add("buttonNotAble");
            document.getElementById("Button11").classList.add("buttonNotAble");
        }
    }

}



//פעולה שמתרחשת בלחיצה על התמונה הראשונה ופותחת את חלון בחירת התמונה הראשונv
function openFileUploader1() {
    $('#FileUpload1').click();
    
    
}
function openFileUploader2() {
    $('#FileUpload2').click();
    
}
$(document).ready(function () {
    
    //לאחר שלחצנו על התמונה שרצינו לבחור - תמונה מספר אחד
    $("#FileUpload1").change(function () {
        
        if (this.files && this.files[0]) {
           
            var reader = new FileReader();

            reader.onload = function (e) {
                
                document.getElementById("Image1").classList.remove("hidden");
                $('#Image1').attr('src', e.target.result);
                document.getElementById("changePic1").value = "true";
                checkIfFull(document.getElementById("HiddenField1").value, document.getElementById("HiddenField2").value);
                console.log("תמונה1" + isFileImage(document.getElementById("Image1")));
            }
            reader.readAsDataURL(this.files[0]);
        }
        
        
      
       

    });
    $("#FileUpload2").change(function () {
        
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                
                document.getElementById("Image2").classList.remove("hidden");
                $('#Image2').attr('src', e.target.result);
                document.getElementById("changePic2").value = "true";
                checkIfFull(document.getElementById("HiddenField1").value, document.getElementById("HiddenField2").value);
               
            }
            reader.readAsDataURL(this.files[0]);
        }
    
    });
});

function onClickText1() {//לחיצה על טקסט פריט 1
    document.getElementById("HiddenField1").value = "";
    document.getElementById("picture").style.visibility = "hidden";
    document.getElementById("Image1").style.visibility = "hidden";
    document.getElementById("chooseFile1").style.visibility = "hidden";
    document.getElementById("TextBox7").style.visibility = "visible";
    document.getElementById("QuestLbl").style.visibility = "visible";
    document.getElementById("Button2").classList.remove("green");
    document.getElementById("Button1").classList.add("green");
    document.getElementById("Button2").classList.add("noFill");
    //שינויי ערכים של הידן פילדס
    document.getElementById("HiddenField1").value = "txt";
    document.getElementById("changeItem1").value = "true";

}
function onClickText2() {//לחיצה על טקסט פריט 2
    document.getElementById("HiddenField2").value = "";
    document.getElementById("picture2").style.visibility = "hidden";
    document.getElementById("Image2").style.visibility = "hidden";
    document.getElementById("chooseFile2").style.visibility = "hidden";
    document.getElementById("TextBox8").style.visibility = "visible";
    document.getElementById("QuestLbl2").style.visibility = "visible";
    document.getElementById("Button8").classList.remove("green");
    document.getElementById("Button3").classList.add("green");
    document.getElementById("Button8").classList.add("noFill");
     //שינויי ערכים של הידן פילדס
    document.getElementById("HiddenField2").value = "txt";
    document.getElementById("changeItem2").value= "true";
}
function onClickPic1() {//לחיצה על תמונה
    document.getElementById("HiddenField1").value = "";
    document.getElementById("picture").style.visibility = "visible";
    document.getElementById("TextBox7").style.visibility = "hidden";
    document.getElementById("QuestLbl").style.visibility = "hidden";
    document.getElementById("Image1").style.visibility = "visible";
    document.getElementById("Image1").classList.add("imageCss");
    document.getElementById("chooseFile1").style.visibility = "visible";
    document.getElementById("Button1").classList.remove("green");
    document.getElementById("Button2").classList.add("green");
    document.getElementById("Button1").classList.add("noFill");
       //שינויי ערכים של הידן פילדס
    document.getElementById("HiddenField1").value = "pic";
    document.getElementById("changeItem1").value = "true";
}
function onClickPic2() {//לחיצה על תמונה
    document.getElementById("HiddenField2").value = "";
    document.getElementById("picture2").style.visibility = "visible";
    document.getElementById("Image2").style.visibility = "visible";
    document.getElementById("Image2").classList.add("imageCss");
    document.getElementById("TextBox8").style.visibility = "hidden";
    document.getElementById("QuestLbl2").style.visibility = "hidden";
    document.getElementById("chooseFile2").style.visibility = "visible";
    document.getElementById("Button3").classList.remove("green");
    document.getElementById("Button8").classList.add("green");
    document.getElementById("Button3").classList.add("noFill");
     //שינויי ערכים של הידן פילדס
    document.getElementById("HiddenField2").value = "pic";
    document.getElementById("changeItem2").value = "true";

}



function isFileImage(file) {//פונק שבודקת האם הקובץ אכן תמונה
    
     console.log((file.src).includes("image"));
    return (file.src).includes("image");
}




