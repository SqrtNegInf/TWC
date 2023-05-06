#!/usr/bin/env perl
use v5.36;

use Data::Dumper;


my $debug=0;
my $n = shift // 18;

#
# my $isdis = disarium( $x );
#	Return 1 iff $x is a disarium number; 0 otherwise.
#
sub disarium
{
	my( $x ) = @_;
	my @dig = split( //, $x );
	my $sum = 0;
	for( my $pos=0; $pos < @dig; $pos++ )
	{
		$sum += $dig[$pos] ** ($pos+1);
	}
	say "debug: dis($x): sum=$sum" if $debug;
	return $sum == $x ? 1 : 0;
}


#my $is = disarium(518);
#die "debug: dis(518) = $is\n";


my @found;
for( my $i = 0; @found < $n; $i++ )
{
	# check if $i is a disarium number, if so add it to @found
	next unless disarium($i);
	say "debug: found dis $i" if $debug;
	push @found, $i;
}

say join(',', @found );
