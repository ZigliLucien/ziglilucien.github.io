#!/usr/bin/perl

@list=`grep -l '*' *.html`;

$^I="";

for (@list) {
chop;
@ARGV=$_;
while (<>) {
  if (/\*(.*?)\*/) {
@qq=split(/\*/);
$qq[1]=~ s/_/ /g;
print @qq;
next;
                      }

print;
}

}
