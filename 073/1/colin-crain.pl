#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## MAIN:


my ($S, @A) = @ARGV;

$S = 3;
@A = (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);

my $end = @A - $S;
my @output;

for ( 0..$end ){
    my $min = minimum( @A[$_..$_+$S-1] );
    push @output, $min;
}


say "input:   @A    window size $S";
say "output:  @output";

## ## ## ## ## SUBS:

sub minimum {
    my $min = "inf";
    $_ < $min and $min = $_ for @_;
    return $min;
}




