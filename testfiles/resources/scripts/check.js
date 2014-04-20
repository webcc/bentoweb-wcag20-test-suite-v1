function simplecheck() {
    var errStr="";
    var month = document.getElementById("id1").value;
    var day = document.getElementById("id2").value;
    var year = document.getElementById("id3").value;
    var i=0;
    
    if ((month=="")||(day=="")||(year=="")) {
      alert("error: Date is incomplete")
      return;
    }
    
    if (!isInteger(month)) {
        errStr="month";
        i++;
    }
    if (!isInteger(day)) {
        errStr+= (errStr=="")?"day":", day";
        i++;
    }
    if (!isInteger(year)) {
        errStr+= (errStr=="")?"year":", year";
        i++;
    }
    if (i==1)
        alert("error: "+errStr+": seems not to a number");
    if (i>1)
        alert("error: "+errStr+": seems not to be numbers");

}

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
