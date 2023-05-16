#!/usr/bin/env perl
use v5.36;

#use Time::HiRes qw(time);

$|=1;

## Finding left-truncated primes.

## Set up primes
my( $T, $t0, $index, $N, $c, @primes ) =
  ( "%6d\t%28d\t%15.6f\n", 0, 0, @ARGV ? $ARGV[0] : 20, 5, 3 );
my @tprimes_current = (3,7);

## The 1-digit primes are 2, 3, 5 and 7.
## All 2-digit primes (that are truncated) end in either 3 or 7, so we use
## the array (3,7) as the starting list of truncated primes...
##
## To get the list of potential truncated primes of length (n+1) by
## looping through each of the primes of length (n) prefixed by the numbers
## 1 .. 9.
##
## We check to see if these are prime - by looking to see if they have
## prime factors < sqrt(n)
##
## (We may need to update the list of primes {less than sqrt(n)}) before
## the check)
##
## We continue around this loop looking at longer and longer primes,
## until we have collected enough primes OR @tprimes_current is empty

#printf $T, ++$index, $_, time-$t0 for 2,3,5,7;
while(1) {
  @tprimes_current||last; ## Exit if there are no current l-trunc primes
                          ## We are at the end of the list...

  my @tprimes_new = ();

  for my $first ( 1..9 ) {
    B: for my $base ( @tprimes_current ) {
      my $p = $first.$base;

      ## Update list of primes...
      for( ;$primes[-1]*$primes[-1]<$p;$c+=2) {
        ($_*$_>$c)?(push(@primes,$c),last):$c%$_||last for @primes;
      }

      ## check if $p is composite;
      $p%$_||next B for @primes;

      ## If not we add the prime to the list of primes of length `n+1`

      push @tprimes_new, $p;

      ## And output the index/prime/and time taken..
      printf $T, ++$index, $p, 0; #time - $t0;
      exit if $index >= $N; ## Stop if we have got to limit set
    }
  }
  ## We use new list we generated as the current list for the
  ## next loop.
  @tprimes_current = @tprimes_new;
}
