$(document).ready(function () {

    document.getElementById("ButtonAdd").disabled = true;
    //בהקלדה בתיבת הטקסט
    $(".CharacterCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".CharacterCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    });


    $("input:checked").each(function () {
        $(this).parent().parent().find(".slider").addClass('SliderChecked');
    });
    //פונקציה שמקבלת את תיבת הטקסט שבה מקלידים ובודקת את מספר התווים
    function checkCharacter(myTextBox) {
        defence();
        //checkIfFull(document.getElementById("HiddenField1").value, document.getElementById("HiddenField2").value);
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

function defence() {
    if (document.getElementById("TextBox1").value.length > 2) {
        document.getElementById("ButtonAdd").disabled = false;
        document.getElementById("ButtonAdd").classList.remove("buttonNotAble");
        
    }
    else {
        document.getElementById("ButtonAdd").disabled = true;
        document.getElementById("ButtonAdd").classList.add("buttonNotAble");

    }
}