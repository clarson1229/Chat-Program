#!C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{
  if (&ReadParse(*input))
  {
    $Company=$input{'Company'};
    $Name=$input{'Name'};
    $Email=$input{'Email'};
    $Random=$input{'Random'};
    open(INFO, ">>Information");
		print INFO "Company= $Company; Name = $Name; Email = $Email; Random = $Random\n";
		close(INFO);
  print <<ABCDEF;
Content-type: text/html; charset = utf8;


  <html>
  <head>
  </head>
  <body>
  <style>
  
  body {
	background-color:#CCFFCC;
  }
  
  </style>
  <script language=Javascript>
		if(window.XMLHttpRequest){
			request = new XMLHttpRequest();
		}else {
			request = new ActiveXObject('Microsoft.XMLHTTP');
		}
    setInterval(getComm, 1000);

    function getComm(){
      request.open('GET', 'getcomfile.pl', true);
      request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      request.send(" ");

      request.onreadystatechange=function(){
	      if(request.readyState==4 && request.status==200){
					document.form1.display.value = request.responseText;
				}
	      else {
	        // alert('error' + request.status + ':' + request.statusText);
	      }
	    }
    }

		function sendmsg(){
			request.open('POST', 'receive.pl', true);
			request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	    request.send('name='    + document.form1.name.value +
									'&company=' + document.form1.companyname.value+
									'&email='   + document.form1.email.value+
                  '&random='  + document.form1.random.value+
									'&msg='     + document.form1.in.value);
	    request.onreadystatechange=function(){
	      if(request.readyState==4 && request.status==200){
					document.form1.in.value='';
				}
	      else {
	        // alert('error' + request.status + ':' + request.statusText);
	      }
	    }
		}
	</script>
  <form name=form1 style="display: inline-block">
    <input type=hidden name=companyname value=$Company>
    <input type=hidden name=name value=$Name>
    <input type=hidden name=email value=$Email>
    <input type=hidden name=random value=$Random>
	
	<div value=$company></div>
	<div id="leftDiv" style="border: solid black">
		
		<textarea name=display rows=30 cols=100>
		</textarea>
	</div>
	
	<div id="rightDiv">
		<br>input: <br>
		<textarea name=in rows=30 cols=100>
		</textarea><br>
	<div>

	<input type=button value="send" onclick='sendmsg()'/>
  </form>
</body>
</html>
ABCDEF
  }
}
