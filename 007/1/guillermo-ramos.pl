#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce);

sub niven {
    my $n = shift;
    return 0 if $n == 0;
    $n % (reduce { $a + $b } split(//, $n)) == 0;
}

foreach (grep { niven $_ } (0..50)) {
    print $_, "\n";
}
