#!/usr/bin/env perl
use v5.36;

use List::Util qw(first);
use Memoize;

my $num = 11111;
die("Number must be an integer") if "$num" ne int($num);

say "$num = " . join( " * ", sort { $a <=> $b } prime_factors($num) );

sub prime_factors($i) {
    if ( $i <= 1 ) { return @{ [$i] }; }

    my $first = first_factor($i);
    return @{ [$i] } unless defined $first;    # It is prime
    return $first, prime_factors( $i / $first );
}

memoize('first_factor');

sub first_factor($i) {
    if ( $i <= 0 ) { return }

    my $sqrt = int( sqrt($i) );

    return first { ( $i % $_ ) == 0 } 2 .. $sqrt;
}

