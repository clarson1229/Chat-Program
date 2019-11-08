#!C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{
	if (&ReadParse(*input))
	{
		$random = rand;
		open(INFO, ">>Information");
		print INFO "Company= $input{'companyname'}; Name = $input{'personname'}; Email = $input{'email'}; Random = $random\n";
		close(INFO);
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

		function trans(){
			request.open('POST', 'receive.pl', true);
			request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	    request.send('name='    + document.form1.name.person +
									'&company=' + document.form1.company.value+
									'&email='   + document.form1.email.value+
									'&msg='     + document.form1.in.value);
	    request.onreadystatechange=function(){
	      if(request.readyState==4 && request.status==200){
					document.form1.display.value = document.form1.display.value + document.form1.in.value;
					document.form1.in.value='';
				}
	      else {
	        // alert('error' + request.status + ':' + request.statusText);
	      }
	    }
		}
	</script>
	<form name=form1>
		<input type=hidden name=random  value=$random>
		<input type=hidden name=company value=$input{'companyname'}>
		<input type=hidden name=person  value=$input{'personname'}>
		<input type=hidden name=email   value=$input{'email'}>
    Infromation Register<br>
		<textarea rows=30 cols=200 name=display>
		</textarea><br><br>
		<textarea rows=10 cols=200 name=in>
		</textarea><br>
		<input type=button value='send' onclick='trans()'>
	</form>
</body>
</html>
ABCDEF
	}
}
