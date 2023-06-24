#!/usr/bin/env perl
use v5.36;

my $last = shift || 45;

foreach my $n ( 1 .. $last ) {
    my $r = $n;
    for (2,3,5) { $r /= $_ until ($r % $_) }
    print $n.$/ if ($r == 1);
}
