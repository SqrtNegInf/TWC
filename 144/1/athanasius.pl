#!/usr/bin/env perl
use v5.36;

###############################################################################
=comment

Perl Weekly Challenge 144
=========================

TASK #1
-------
*Semiprime*

Submitted by: Mohammad S Anwar

Write a script to generate all Semiprime number <= 100.

For more information about Semiprime, please checkout the
[ https://en.wikipedia.org/wiki/Semiprime |wikipedia page].

    In mathematics, a semiprime is a natural number that is the product of
    exactly two prime numbers. The two primes in the product may equal each
    other, so the semiprimes include the squares of prime numbers.

Example

 10 is Semiprime as 10 = 2 x 5
 15 is Semiprime as 15 = 3 x 5

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=comment

Algorithm
---------
(1) Primes are generated via a Sieve of Eratosthenes. But how many primes are
    needed? Consider: each semiprime is the product of 2 primes, and the small-
    est prime is 2. If a given prime p is such that 2p is greater than 100,
    then 3p will also be greater than 100, as will 5p, and so on, so p cannot
    contribute to the semiprimes less than or equal to 100. And the same logic
    holds for any prime number greater than p. So the primes needed are 2, 3,
    5, ..., q, where q is the largest prime for which 2q is less than or equal
    to 100.

(2) For each prime p, semiprimes are generated by multiplying p by each of the
    primes q between 2 and p, inclusive. But as soon as the product is greater
    than 100, the result is discarded and the remaining values of q can also be
    skipped, since they will all generate semiprimes greater than 100.

(3) The resulting list is guaranteed to include all semiprimes less than or
    equal to 100, and only those. But in some cases semiprimes are generated
    out of order. For example, 5 x 3 = 15 is generated before 7 x 2 = 14. It is
    therefore necessary to sort the semiprimes (in ascending numerical order)
    before they are displayed.

(4) The resulting list of semiprimes contains 34 elements as follows:

         4,  6,  9, 10, 14, 15, 21, 22, 25, 26, 33, 34, 35, 38, 39, 46, 49,
        51, 55, 57, 58, 62, 65, 69, 74, 77, 82, 85, 86, 87, 91, 93, 94, 95

    -- which agrees with the entry for Semiprimes in the Online Encyclopedia of
    Integer Sequences, https://oeis.org/A001358

=cut
#==============================================================================

use strict;
use warnings;
use Const::Fast;

const my $MAX   =>  100;
const my $USAGE => "Usage:\n  perl $0\n";

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #$| = 1;
    #print "\nChallenge 144, Task #1: Semiprime (Perl)\n\n";
}

#==============================================================================
MAIN:
#==============================================================================
{
    #my $args = scalar @ARGV;
    #   $args == 0 or error( "Expected 0 command line arguments, found $args" );

    print "The semiprimes <= $MAX are:\n\n";

    my $primes = find_primes();
    my @semiprimes;

    L_OUTER:
    for my $i (0 .. $#$primes)
    {
        my $prime1 = $primes->[ $i ];

        for my $j (0 .. $i)
        {
            my $prime2  = $primes->[ $j ];
            my $product = $prime1 * $prime2;

            next L_OUTER if $product > $MAX;

            push @semiprimes, $product;
        }
    }

    @semiprimes = sort { $a <=> $b } @semiprimes;

    printf "%s\n", join ', ', @semiprimes;
}

#------------------------------------------------------------------------------
sub find_primes
#------------------------------------------------------------------------------
{
    use enum qw( NOT_PRIME PRIME );

    my $max   = int( $MAX / 2 );
    my @sieve = ((NOT_PRIME) x 2, (PRIME) x ($max - 1));
    my @primes;

    for my $i (2 .. $max)
    {
        if ($sieve[ $i ] == PRIME)
        {
            push @primes, $i;

            for (my $j = 2 * $i; $j <= $max; $j += $i)
            {
                $sieve[ $j ] = NOT_PRIME;
            }
        }
    }

    return \@primes;
}

#------------------------------------------------------------------------------
sub error
#------------------------------------------------------------------------------
{
    my ($message) = @_;

    die "ERROR: $message\n$USAGE";
}

###############################################################################
