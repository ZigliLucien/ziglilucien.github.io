#! /usr/bin/perl

@list=`grep -l "<body>" * | grep html`;

$^I="";

$timest="
<!-- hhmts start -->
<!-- hhmts end -->
";


for (@list) {
chop;

@ARGV=$_;
while (<>) {
print $timest if /^<\/body|^<\/BODY/;
print;
}
}
