#!C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{

    open (FILE, "Communication"),
    $/=EOF123;
    $file =<FILE>;
    print <<ABCDEF;
    Content-type: text/html; charset = utf8;


$file
ABCDEF
close(FILE);

}
