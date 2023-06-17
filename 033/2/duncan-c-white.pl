#!/usr/bin/env perl
use v5.36;

sub line
{
	my( $label, $gap, $scale ) = @_;
	printf "%4s|", $label;
	printf "%4s", '' for 1..$gap;
	printf "%4d", $_*$scale for $gap+1..11;
	print "\n";
}

line( "x", 0, 1 );
say '-' x 49;
for( 1..11 )
{
	line( $_, $_-1, $_ );
}
