#!/usr/bin/env perl



use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## MAIN:

my $num = $ARGV[0] // 7;
say S($num);

## ## ## ## ## SUBS:

sub S {
    my $n = shift;
    return '' if $n == 0;
    my $str = S ($n-1);
    return $str . '0' . reverse( $str =~ tr/01/10/r );
}
