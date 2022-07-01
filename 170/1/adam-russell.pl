#!/usr/bin/env perl

use strict;
use warnings;
use boolean;
use constant N => 10;
use Math::Primality qw/is_prime/;

sub n_primes{
    my($n) = @_;
    my @primes = (1);
    return @primes if $n == 0;
    my $x = 2;
    {
        push @primes, $x if is_prime($x);
        $x++;
        redo if @primes < $n;
    }
    return @primes;
}

sub n_primorials{
    my($n) = @_; 
    my $x = 0;
    my @primes = n_primes($n);
    my @primorials;
    {
        my $primorial = 1;
        map {$primorial *= $_} @primes[0 .. $x];
        push @primorials, $primorial;
        $x++;
        redo if $x < $n;
    }
    return @primorials;
}

MAIN:{
    my @primorials = n_primorials(N);
    for(my $i = 0; $i < @primorials; $i++){
        print "P($i) = $primorials[$i]\n";
    }
}
