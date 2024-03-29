#!/usr/bin/perl

# $Id: metar.t,v 1.3 1999/02/20 23:15:40 jzawodn Exp $

# Test script for METAR installation.

use strict;
use Test;

BEGIN { plan tests => 6 }

use Geo::METAR;

my %tally = (passed => 0, failed => 0, skipped => 0);

print "Testing METAR.\n";

my $m = new Geo::METAR;

# Create a new instance.

if ($m) {
    ok(1);
} else {
    ok(0);
}

# Set to a given user.

if ($m->metar("KFDY 251450Z 21012G21KT 8SM OVC065 04/M01 A3010 RMK 57014")) {
    ok(1);
} else {
    ok(0);
}

if ($m->SITE eq "KFDY") {
    ok(1);
} else {
    ok(0);
}

if ($m->DATE eq "25") {
    ok(1);
} else {
    ok(0);
}

if ($m->MOD eq "AUTO") {
    ok(1);
} else {
    ok(0);
}

if ($m->F_TEMP eq "39.2") {
    ok(1);
} else {
    ok(0);
}

exit;

__END__


