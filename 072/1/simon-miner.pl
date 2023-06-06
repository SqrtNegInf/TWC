#!/usr/bin/env perl
use v5.36;

my $n = 10;

my $fact = 1;
$fact *= $_ for ( 1 .. $n );
my ( $trailing_zeroes ) = ( $fact =~ m/(0+)$/ );
my $trailing_zero_count = defined( $trailing_zeroes ) ? length( $trailing_zeroes ) : 0;

print "$trailing_zero_count ($n! = $fact)\n";
