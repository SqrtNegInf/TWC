#!/usr/bin/env perl
use v5.36;

use Carp;
use Try::Tiny;
use Math::Prime::XS qw{ is_prime };

#$| = 1;

my @n =  10;

for my $i (@n) {
    try {
        my $p = get_home_prime($i);
        say join "\t", '-', $i, $p;
    }
    catch {
        say $_;
    };
}

sub get_home_prime($n) {
    my $p = $n;
    while ( !is_prime($p) ) {
        my @factors = get_factors($p);
        $p = join '', @factors;
        print qq{$p };
        # croak 'Too Big, Too Slow' if length $p > 10;
    }
    say '';
    return $p;
}

sub get_factors( $n ) {
    my @factors;
    for my $i ( 2 .. $n ) {
        next unless $n % $i == 0;
        while ( $n % $i == 0 ) {
            push @factors, $i;
            $n = $n / $i;
        }
    }
    return @factors;
}

