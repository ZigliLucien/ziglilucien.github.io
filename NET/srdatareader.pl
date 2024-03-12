#!/usr/bin/perl

&DoSun;

#$srise += 100; $sset +=100; $srise = "0".$srise;

$e = "\t\t<Sunrise> $srise CDT <\/Sunrise>\n";
$f = "\t\t<Sunset> $sset CDT <\/Sunset>\n";


print "$e\n $f\n";

sub DoSun{

$ttt = scalar localtime;

@ttu = localtime;

@date = split(/\s+/,$ttt);

print "$date[1] $date[2]\n";

open(SUNIN,"sunrisesunset.data");
while (<SUNIN>) {

next unless /^0?$date[2]\s/;

@suninfo = split;

$idx = 2*$ttu[4];

$srise = $suninfo[$idx+1]; $sset = $suninfo[$idx+2];

}

close SUNIN;

}
