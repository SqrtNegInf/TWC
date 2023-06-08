#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw{sum};

my $M = 5;
my $N = 2;

GetOptions(
    'm=i' => \$M,
    'n=i' => \$N,
);

say div_wo_div($M,$N);
exit;

sub div_wo_div ( $num = 5, $denom = 2 ) {
    return 0          if $num == 0;
    return 'infinity' if $denom == 0;
    my $neg_result = 0;
    my $quotent    = 0;

    if ( $num < 0 ) {
        $num = abs $num;
        if   ( $denom < 0 ) { $denom      = abs $denom; }
        else                { $neg_result = 1 }
    }
    elsif ( $denom < 0 ) {
        $denom      = abs $denom;
        $neg_result = 1;
    }

    while ( $num >= $denom ) {
        $num -= $denom;
        $quotent++;
    }

    $quotent = -$quotent if $neg_result;
    $quotent-- if $num > 0 && $neg_result;
    return $quotent;
}
