#!/usr/bin/env perl
use v5.36;

use Function::Parameters;
use List::Util qw(sum);

my( $n, $d ) = (24,7);

my $total = sum( grep { /7/ } 1..$n );
my $correct = ($total == $n) ? 1 : 0;

print "total=$total, correct=$correct\n";
