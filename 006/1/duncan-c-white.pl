#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;
use Data::Dumper;

my $minlen = 3;
my @in = <1 2 3 4 9 10 14 15 16>;

my @out;

while( @in )
{
	my $s = shift @in;	 # new sequence s..s
	my $e = $s;
	while( @in && $in[0] == $e+1 )
	{
		$e = shift @in;
	}
	#print "s=$s, e=$e\n";
	push @out,
		(( $e-$s+1 >= $minlen ) ?
		"$s-$e" :
		join( ',', $s..$e ));
}
print join(',',@out)."\n";
