#!c:\perl\bin\perl

# Arguments to this run are: filename then the category names to search on
# Last argument is the default category to sort on

$dbase = shift;

$sortdefault = ucfirst lc pop @ARGV;

for(@ARGV) { $keyfields{$_}=1;}

@hashcategories = sort keys %keyfields;

for (@hashcategories){

push @hashnames, lc $_;

}

open(IN2,"$dbase.xml");

while(<IN2>){

next if /\?xml/;

$aline = $_;

for $k (0..$#hashcategories) {

  if ($aline=~/$hashcategories[$k] key/)
{
@line = split(/key="|">|<\//,$aline);
$key = $line[1];
${$hashnames[$k]}{$key} = $line[2];
}
}
}

open(OUT2,">codesheets");
select OUT2;

for $qq (@hashnames){

print '%',$qq,'=(',"\n";

for (keys %{$qq})
{
($entry = ${$qq}{$_}) =~ s/\n//;

s/(\d)-(\d)/$1Y$2/;

s/\W//g;

s/(\d)Y(\d)/$1-$2/;

print "\"$_\" => \"$entry\",\n";
}
print ");\n\n";
}


print "1";

close OUT2;

open(OUT3,">".$dbase.".searchpage.html");
select OUT3;

print "<html>
<head><title> Search $dbase <\/title>
";

print '
<meta name="keywords" content="search articles papers Krawtchouk Kravchuk polynomials">
<meta name="description" content="pages dedicated to Krawtchouk matrices and polynomials">

<style type="text/css">

input { color: red; background-color: white}
input.res { color: green; background-color: white}
option { color: white; background-color: blue}

</style>
</head>

<!-- *************** directions *********************** -->
<body bgcolor="lightblue" background="">
<table width=100% border=0>
<tr><td align left><font face=arial size=-2><font color=red>KRAWTCHOUK ENCYCLOPEDIA:</font>
   <a href=../index.htm>home</a> &gt;
   <!a href=news.htm>bibliography<!/a>  
</td><td align=right><font face=arial size=-2 color=green>
   updated: 17 july 01</font></td>
</tr></table>
<hr>
<!-- ************************************************** -->


<h1> Search</h1>
';

require "codesheets";

print "
Click on the field you wish to search on. Select from the available choices.
<p>

<form method=\"get\">
";

for $j (0..$#hashcategories){

$name = ucfirst lc $hashcategories[$j];
print"
$name <select name=\"$name\">
<option>All</option>";

for(sort keys %{$hashnames[$j]}) { 

($content = ${$hashnames[$j]}{$_})=~ s/\"|\{|\}|\'|\\|\=//g;

print "<option value=$_>$content</option>\n";}
print"</select><p>";

}

print '
<input type=submit> &#160; <input type=reset class=res>
<p>
';

print "
Option - Sort by: <select name=\"Sort\">
<option> $sortdefault </option>
";

for $j (0..$#hashcategories){

$name = ucfirst lc $hashcategories[$j];

next if ($name eq $sortdefault) ;

if ($name =~ /Year/){
print "\n<option> $name desc </option>\n";
print "<option> $name asc </option>\n";

} else {

print "<option> $name </option>";
}
}

print"</select><p>

</form>

</body>
</html>
";

close OUT3;

open(OUT4,">$dbase.properties");

print OUT4 "datafile = $dbase.xml
stringProcessFile = xmlquery.xsl
sortFile = sorter.xsl
";

close OUT4;
