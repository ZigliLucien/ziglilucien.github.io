#!/usr/bin/perl

$^I="";

while(<>){

$start=0 ;

if(/DOCTYPE/ && !$start){

$start=1;

print '<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/plain" href="ServPak/xsl/moreover.xsl"?>
';

next; 

}

print;

}
