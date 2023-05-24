#!/usr/bin/env perl
use v5.36;

use Carp;
use Getopt::Long;

my $n = 150;

GetOptions( 'n=i' => \$n, );
carp 'Bad Input' unless $n > 0;

my $u = get_ugly($n);
say "Input:  \$n = $n  Output: $u";

sub get_ugly ( $n ) {
    my $c = 0;
    my $u = 0;
    while (1) {
        $u++;
        my $f = is_ugly($u) ? 1 : 0;
        $c++ if $f;
        return $u if $n == $c;
    }
}

sub is_ugly( $n ) {
    for my $i ( 2, 3, 5 ) {
        while ( $n % $i == 0 ) {
            $n /= $i;
        }
    }
    return $n == 1 ? 1 : 0;
}
