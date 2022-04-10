#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my ($start, $end) = (111,999);
chomp $end;
die "Invalid parameters" if $start !~ /^\d{3}$/ or $end !~ /^\d{3}$/;
($start, $end) = ($end, $start) if $start > $end;
for my $num ($start..$end) {
    my @digits = split //, $num;
    if (abs($digits[0] - $digits[1]) == 1 &&
        abs($digits[1] - $digits[2]) == 1) {
        say "$num is a stepping number.";
    }
}
