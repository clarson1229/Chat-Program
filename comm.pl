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
  print <<ABCDEF;
Content-type: text/html; charset = utf8;


  <html>
  <head>
  </head>
  <body>
  <script language=Javascript>
		if(window.XMLHttpRequest){
			request = new XMLHttpRequest();
		}else {
			request = new ActiveXObject('Microsoft.XMLHTTP');
		}
    setInterval(getComm, 1000);

    function getComm(){
      request.open('GET', 'getcomfile.pl?Random=' + document.form1.random.value, true);
      request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      request.send(' ');

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
                  '&Random='  + document.form1.random.value+
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
  <form name=form1>
    <input type=hidden name=companyname value=$Company>
    <input type=hidden name=name value=$Name>
    <input type=hidden name=email value=$Email>
    <input type=hidden name=random value=$Random>
    <textarea name=display rows=40 cols=100>
    </textarea>
    <br>input: <br>
    <textarea name=in rows=40 cols=100>
    </textarea><br>
    <input type=button value="send" onclick='sendmsg()'

  </form>
</body>
</html>
ABCDEF
  }
}
