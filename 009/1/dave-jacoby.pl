#!/usr/bin/env perl
use v5.36;

use List::Util qw{uniq};

while (1) {
    my $d = infinite_iterator(); # gets set each loop
    if ( test($d) ) { say $d ; exit; }
}

sub infinite_iterator {
    state $x = 0;
    return ++$x**2; # $x += 1; $s = $x squared; return $s;
}

sub test ( $square ) {
    my @square = uniq split //, $square;
    return scalar @square > 4 ? 1 : 0 ;
    # that is a ternary operator, and it is the same as
    #   return 1 if scalar @square > 4;
    #   return 0;
}

