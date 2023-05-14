#!/usr/bin/env perl
use v5.36;

use List::Util qw{ uniq };

my @primes;

# redo as iterator?
my @padovan;
push @padovan, 1, 1, 1;
while ( scalar @primes < 10 ) {
    my $n = $padovan[-3] + $padovan[-2];
    push @padovan, $n;
    push @primes,  $n if is_prime($n);
    @primes = uniq @primes;
}

say join ' ', @primes;

sub is_prime ($n) {
    for ( 2 .. sqrt $n ) { return unless $n % $_ }
    return 1;
}
