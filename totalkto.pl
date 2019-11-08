#!C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{
	if (&ReadParse(*input))
	{
		open(INFO, "Information");

		print qq(Content-Type: text/html; charset=utf-8;\n\n
		<html><head><meta charset="utf-8"></head><body>);

		$/ = "\n";
		while ($info= <INFO>){


			$info =~ /Company= ([^;]+);/;
			$Company = $1;
			$info =~ /Name = ([^;]+);/;
			$Name = $1;
			$info =~ /Email = ([^;]+);/;
			$Email = $1;
			$info =~ /Random = ([^;]+)/;
			$Random = $1;

			print qq(<a href="comm.pl?Company=$Company&Name=$Name&Email=$Email&Random=$Random">);
			print qq(Company:$Company Name: $Name Email: $Email Random: $Random);
			print qq(</a><br>);

		}
		print qq(</body></html>);

		close(INFO);
	}
}
