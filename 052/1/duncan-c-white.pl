#!/usr/bin/env perl
use v5.36;

my $from = shift // 100;
my $to   = shift // 999;

sub stepping( $x )
{
	my @digits = split(//,$x);
	my $prev = shift @digits;
	foreach my $next (@digits)
	{
		return 0 unless $next == $prev+1;
		$prev = $next;
	}
	return 1;
}


foreach my $n ($from..$to)
{
	say $n if stepping($n);
}
