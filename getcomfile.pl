#!C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{
  if (&ReadParse(*input))
  {
    open (FILE, "Communication$input{'Random'}"),
    $/=EOF123;
    $file =<FILE>;
    print <<ABCDEF;
    Content-type: text/html; charset = utf8;


$file
ABCDEF
close(FILE);
  }
}
