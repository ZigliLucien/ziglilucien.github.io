#!/usr/bin/perl

$count = 0;

open OUT,">dewdata";
select OUT;

while(<>){

next unless (/^|/ and /F\./);
chomp;
@line = split(/\|/);
$val = $line[3];
@x = split(/ /,$val);
$vv = $x[1];
if($count!=0){print "$count   $vv\n"};
$count+=1;
}

close OUT;
`/usr/bin/graph -T png --bitmap-size 480x480 -Y "DewPoint" -X "Time" -L "Recent DewPoints" < dewdata > dewpoint.png`;
