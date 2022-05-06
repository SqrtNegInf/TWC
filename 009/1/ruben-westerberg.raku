#!/usr/bin/env raku

my $result;
(0..*).map({
	my $sq= $_**2;
	$result=$sq;
	last if ($sq.comb.Bag.keys)>=5;

});
say $result;
