#!C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{
	if (&ReadParse(*input))
	{

		open(INFO, ">>communication$input{'Random'}");
		print INFO "Company= $input{'company'}; Name = $input{'name'}; Email = $input{'email'}; Random = $input{'Random'}; Message= $input{'msg'}\n";
		close(INFO);
		print <<ABCDEF;
Content-type: text/html; charset = utf8;


<html>
<head>
</head>
<body>

</body>
</html>
ABCDEF
	}
}
