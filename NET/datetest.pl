#!/usr/bin/perl
#
#
$x = scalar localtime;
@x = split(/ /,$x);
print "\n The year is $x[$#x]\n";
