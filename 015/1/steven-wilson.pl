#!/usr/bin/env perl
use v5.36;

my $previous_prime = 2;
my $current_prime  = 3;
my $next           = 5;
my @strong_primes;
my @weak_primes;

while ( ( @strong_primes < 10 || @weak_primes < 10 ) ) {
    my $is_prime = is_prime($next);
    if ( $is_prime
        && ( $current_prime > ( ( $previous_prime + $next ) / 2 ) ) )
    {
        push @strong_primes, $current_prime;
    }
    elsif ( $is_prime
        && ( $current_prime < ( ( $previous_prime + $next ) / 2 ) ) )
    {
        push @weak_primes, $current_prime;
    }
    if ($is_prime) {
        ( $previous_prime, $current_prime ) = ( $current_prime, $next );
    }
    $next++;
}

sub is_prime {
    my $number   = shift;
    my $is_prime = 1;
    for ( 2 .. sqrt($number) ) {
        if ( $number % $_ == 0 ) {
            $is_prime = 0;
            last;
        }
    }
    return $is_prime;
}

print "First 10 strong primes: ";
print "@strong_primes\n";
print "First 10 weak primes: ";
print "@weak_primes\n";
