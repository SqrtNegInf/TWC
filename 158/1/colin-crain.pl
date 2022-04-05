#!/usr/bin/env perl

use warnings;
use strict;
use utf8;
use feature ":5.26";
use feature qw(signatures);
no warnings 'experimental::signatures';

use List::Util qw( sum0 );

my @primes;
my %lookup;
my @additives;

## make a closed prime iterator function
## modified to add to the prime lookup hash
my $pg =  sub {
    if ( @primes < 2 ) {
        push @primes, @primes == 0 ? 2 : 3;
        $lookup{ $primes[-1] } = 1;
        return $primes[-1];
    }

    my $candidate = $primes[-1] ;
    CANDIDATE: while ( $candidate += 2 ) {
        my $sqrt_candidate = sqrt( $candidate );
        for my $test ( @primes ) {
            next CANDIDATE if $candidate % $test == 0;
            last if $test > $sqrt_candidate;
        }
        push @primes, $candidate;
        $lookup{ $candidate } = 1;
        return $candidate;
    }
} ;
$pg->();        ## init the prime array with 2

my $limit = shift @ARGV // 100;

## look at the numbers 1 to $limit,
## checking each for primality and primality in the digit sum
for ( 1..$limit ) {
    $pg->() if $primes[-1] <= $_ ;
    next unless $lookup{$_} ;
    my $sum = sum0( split //, $_ );
    push @additives, $_ if  $lookup{$sum};
}

say join ', ',  @additives;



 
