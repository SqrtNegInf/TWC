#!/usr/bin/env perl

use warnings;
use strict;

chomp(my $number = -1700);

die "Not an integer" unless $number =~ /^[+-]?\d+\z/;

if ($number > 2147483647 || $number < -2147483647) {
    print "0\n";
} else {
    if ($number < 0) {
        $number = $number * -1;
        print "-", scalar reverse($number), "\n";
    } else {
        print scalar reverse($number), "\n";
    }
}
