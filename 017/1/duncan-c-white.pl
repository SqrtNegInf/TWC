#!/usr/bin/env perl

use strict;
use warnings;
use Function::Parameters;
use Data::Dumper;
use Memoize;

my $m = shift // 2;
my $n = shift // 1;

#
# my $amn = A($m,$n);
#	Calculate Ackermann's function for m,n>=0
#       A(m, n) = n + 1                  if m = 0
#       A(m, n) = A(m - 1, 1)            if m > 0 and n = 0
#       A(m, n) = A(m - 1, A(m, n - 1))  if m > 0 and n > 0
#
fun A( $m, $n )
{
	die "A($m,$n): m $m must be positive\n" if $m<0;
	die "A($m,$n): n $n must be positive\n" if $n<0;
	return $n+1 if $m == 0;
	return A($m-1,1) if $m>0 && $n==0;
        return A($m - 1, A($m, $n - 1));
}

memoize("A");

my $amn = A($m,$n);
print "A($m,$n) = $amn\n";
