#!/usr/bin/perl

$^I="";

$dt = scalar localtime;
@dt = split(/\s/,$dt);
$yr = $dt[$#dt];

while(<>) {

  if (/CARBONDALE|Carbondale/) { 
print "<html>
<body>
<center>
<h2> Jackson County Weather Forecast </h2><p/> 
<i> National Weather Service <br/> Paducah, Kentucky</i>
</center>
";
$flag0	= 1;
next;}

next unless $flag0;

if (/(.*)$yr/) {
$x = $1;
print "<br/><center>
$x $yr
</center>
";
$flag = 1;
next;
}


next unless $flag;

if (/\$\$/) {

    ($yy = $y) =~ s/\./<br\/>/g;
 @line = split(/<br\/>/,$yy);

	$z = "";

	$count = 0;

for(@line){

	$_=uc($_);

	if($count>0) { $aux = "<br/>"; } else { $aux="";}

	   if(/(HIGHS|LOWS)/){ $_="<$1>$_</$1>";}
	 $z .="$aux\n$_";

	$count++;	

	}


print "
$z</data>
                 </entry>
&#160; 
<p/>
<hr/>
<p/>
</body>
</html>
";
	last;
}

	if(/\.(.*?)\.\.\.(.*)/) {
$goflag = 1;
	if($dataflag){

    ($yy = $y) =~ s/\./<br\/>/g;

 @line = split(/<br\/>/,$yy);


	$z = "";

	$count = 0;

for(@line){

	$_=uc($_);

	if($count>0) { $aux = "<br/>"; } else { $aux="";}

	   if(/(HIGHS|LOWS)/){ $_="<$1>$_</$1>";}
	 $z .="$aux\n$_";

	$count++;	

	}

	print "$z</data>\n</entry>\n";
	}

		print "
		<entry><em> $1 </em>
	<data>
	";

	($y = $2) =~ s/\.\.\./\./;

	$dataflag = 1;	
	next;
	} else {
if(/^$/) {$goflag = 0;}
next unless $goflag;

	              $y =~ s/\.\.\./\./;
		$y .= " $_";
	}

}




