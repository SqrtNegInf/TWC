#!/usr/bin/env perl
use v5.36;

sub is_prime ($n) {
    return 0 if grep { $n % $_ == 0 } ( 2 .. sqrt($n) );

    return 1;
}

sub prime_iterator {
    my $n = 1;
    return sub {
        1 until is_prime ++$n;
        return $n;
    }
}

my ( @primes, @strong_primes, @weak_primes, @bal_primes );
my @which_arr = ( \@bal_primes, \@strong_primes, \@weak_primes );
my $iter      = prime_iterator();
my $n         = 10;

while ( ( @strong_primes < $n ) || ( @weak_primes < $n ) ) {
    push @primes, $iter->();
    if ( @primes > 2 ) {
        push $which_arr[ ( $primes[-2] <=> ( $primes[-3] + $primes[-1] ) / 2 )
        ]->@*, $primes[-2];
    }
}

say "First 10 strong primes: " . join( ", ", @strong_primes );
say "First 10 weak primes: " . join( ", ", @weak_primes );
