#!/usr/bin/env perl
use v5.36;

my $n = 4;

die "gray-code: 1 <= N <= 5 ($n given)\n" unless $n>=1 && $n<=5;

my @seq = (0,1);	# gray(1)
foreach my $i (2..$n)
{
	# the core of the method:
	#	- reverse:        @x = reverse @seq
	#	- cvt to binary (i-1 digits long, leading zeroes):
	#			  @x = map { sprintf( "%0*b", i-1, $_ ) } @x
	#	- prepend 1:      @x = map { "1$_" } @x
	#	- cvt to decimal: @x = map { eval "0b$_" }  @x )
	my @mutate = map { eval sprintf( "0b1%0*b", $i-1, $_ ) } reverse @seq;
	#die Dumper \@mutate;
	push @seq, @mutate;
	#warn Dumper \@seq;
}

say "gray($n) = ", join(',',@seq);
