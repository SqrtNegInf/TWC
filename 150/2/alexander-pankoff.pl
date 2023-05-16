#!/usr/bin/env perl
use v5.36;

run() unless caller();

sub run() {

    # For this challenge we can take advantage of perls builtin `grep` routine
    # to filter the list of integers <=500 with a is_squarefree routine that we
    # are about to define.
    my @square_free = grep { is_squarefree($_) } 1 .. 500;

    # Afterwards we print the filtered list, seperated by commas.
    say join( ', ', @square_free );

    # Done.
}

sub is_squarefree($x) {

    # According to the description, we have to do two things to check if a
    # number is squarefree.  First we get the prime factors of that number,
    my @prime_factors = prime_factors($x);

    # and then we check wether this list is free of duplicates.
    return no_dupes(@prime_factors);
}

sub prime_factors($x) {
    my @factors;
    my $prime = 0;
    while ( $x > 1 ) {
        my $test_factor = primes($prime);
        $prime++;
        next unless $x % $test_factor == 0;
        push @factors, $test_factor;
        $x     = $x / $test_factor;
        $prime = 0;
    }
    return @factors;
}

sub primes($n) {
    state @primes = (2);

    for ( my $i = $primes[-1] + 1 ; $#primes < $n ; $i++ ) {
        push @primes, $i if is_prime($i);
    }

    return $primes[$n];
}

sub is_prime($x) {
    return 0 if $x <= 1;
    return 1 if $x <= 3;
    for ( my $i = 2 ; $i < sqrt($x) ; $i++ ) {
        return 0 if $x % $i == 0;
    }
    return 1;
}

sub no_dupes(@xs) {
    my %seen;
    for my $x (@xs) {
        return 0 if $seen{$x}++;
    }
    return 1;
}
