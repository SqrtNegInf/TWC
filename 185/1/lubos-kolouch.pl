#!/usr/bin/env perl
use v5.36;
sub convert_mac {
    my $what = shift;

    $what =~ s/\.//g;
    my @arr = ( $what =~ /../g );
    return join( ':', @arr );
}

use Test::More;

is( convert_mac('1ac2.34f0.b1c2'), '1a:c2:34:f0:b1:c2' );
is( convert_mac('abc1.20f1.345a'), 'ab:c1:20:f1:34:5a' );

done_testing;
