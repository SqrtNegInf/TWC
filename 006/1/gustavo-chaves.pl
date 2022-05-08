#!/usr/bin/env perl

use strict;
use warnings;

my ($from, @list) = split /,/, '1,2,3,4,9,10,14,15,16';
my $to = $from;

foreach my $n (@list) {
    if ($n > $to + 1) {
        print $from == $to ? "$to," : "$from-$to,";
        $from = $n;
    }
    $to = $n;
}

print $from == $to ? "$to\n" : "$from-$to\n";
