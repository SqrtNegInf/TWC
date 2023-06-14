#!/usr/bin/env perl
use v5.36;

my $upto = shift || 50;

foreach (1 .. $upto){
    print $_ . ' ' if is_prime( scalar prime_decomp($_) );
}


sub prime_decomp {
    my $n = shift;

    my @prime_decomp;

    foreach my $prime ( prime_factors($n) ){
        do {
            $n /= $prime;
            push @prime_decomp, $prime;
        } while ($n % $prime == 0);
    }

    return @prime_decomp;
}


sub prime_factors {
    my $n = shift;
    return if $n <= 1;
    my @r = grep {$n % $_ == 0 && is_prime($_)} (2 .. $n/2); #get prime divisors
    return @r ? @r : ($n); # number is prime if no prime divisors were found
}

sub is_prime {
    my $n = shift;
    return if $n <= 1;
    #every composite number has a prime factor less than or equal to its square root.
    return 1 == grep {$n % $_ == 0} (1 .. sqrt $n);
}
