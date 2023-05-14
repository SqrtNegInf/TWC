#!/usr/bin/env perl
use v5.36;

use List::Util qw{ product };
use Math::Prime::Util qw{ nth_prime next_prime primes };

sub fortunate_number {
    my ($n) = @_;
    my $p    = nth_prime($n);
    my $prod = product(@{ primes($p) });
    my $next = next_prime($prod + 1);
    return $next - $prod
}

sub fortunate_numbers {
    my ($count) = @_;
    my $i = 1;
    my %f;
    undef $f{ fortunate_number($i++) } while $count > keys %f;
    return sort { $a <=> $b } keys %f
}

say join ', ', fortunate_numbers(8);
