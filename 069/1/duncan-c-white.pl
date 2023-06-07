#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(pairwise any);

my %inverse = qw(0 0 1 1 8 8 6 9 9 6);

#
# my $isstrobo = strobo( $x );
#	Return 1 iff $x is strobogrammatic, else 0.
#
sub strobo( $x )
{
	return 0 if $x =~ /[2-57]/;
	my @d = split(//,$x);
	my @r = reverse @d;
	my @ok = pairwise { 
		#say "debug: a=$a, b=$b, inverse(a)=$inverse{$a}";
		$inverse{$a} == $b ? 1 : 0
	} @d, @r;
	#say "debug: ok=", join(',',@ok);
	return 0 if any { $_ == 0 } @ok;
	return 1;
}



my( $m, $n ) = (1,200);

say "strobogrammatic numbers between $m and $n are:";

foreach my $i ($m..$n)
{
	say $i if strobo($i);
}
