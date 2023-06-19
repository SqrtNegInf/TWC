#!/usr/bin/env perl
use v5.36;

my $i //= 49;

my $n = 2**$i;
my $e = find_euler($n);

say <<"END";
    i = $i
    n = $n
    e = $e

END
exit;

sub find_euler ( $n ) {
    return ( ( 1 + ( 1 / $n ) )**$n );
}

