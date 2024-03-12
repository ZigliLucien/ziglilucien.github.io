#!/usr/bin/perl

$^I="";

while(<>){

next if /xml/;

s/\s*\b(.*)/$1/;

next if exists $hash{$_};

$hash{$_}=1;

`wget -N $_`;

print;

}
