#!/usr/bin/env perl
use v5.36;

use Memoize;

my $m = shift // 2;
my $n = shift // 1;

sub A( $m, $n )
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
