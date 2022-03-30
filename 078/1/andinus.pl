#!/usr/bin/env perl

use strict;
use warnings;

my @leader;
my @ARGV = <9 10 7 5 6 1>;
MAIN: while (my $arg = shift @ARGV) {
    foreach my $elm (@ARGV) {
        next MAIN if $arg < $elm;
    }
    push @leader, $arg;
}

print join(', ', @leader), "\n";
