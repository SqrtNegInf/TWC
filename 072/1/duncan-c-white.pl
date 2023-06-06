#!/usr/bin/env perl
use v5.36;

my( $n ) = 10;

die "fact-trailing-zeroes: N must be >= 0 ($n given)\n" unless $n>=0;

my $fact = 1;
$fact *= $_ for 1..$n;
say "fact(n) = $fact";

# trailing zeroes of fact
my $tz = 0;
my $i = $fact;
while( $i % 10 == 0 )
{
	$i /= 10;
	$tz++;
}
say "trailing zeroes($fact) = $tz";
