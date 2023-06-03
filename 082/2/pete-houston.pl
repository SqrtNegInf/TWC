#!/usr/bin/env perl
use v5.36;

my @sub = ('XXY', 'XXZ', 'XXXXZY');
my $str = pop @sub;

# No point going further if this basic test fails
nope () if length ($str) ne length ($sub[0] . $sub[1]);

# Try tucking first substring into second, then vice-versa
for my $i (0, 1) {
	my $j = 1 - $i;
	my $jpos = index ($str, $sub[$j]);
	while ($jpos > -1) {
		# $sub[$j] is contained within $str, so strip it and see if we
		# are left with $sub[$i]
		my $copy = $str;
		substr ($copy, $jpos, length ($sub[$j]), '');
		yep () if $copy eq $sub[$i];
		# No joy, so keep looking
		$jpos = index ($str, $sub[$j], $jpos + 1);
	}
}
nope ();

sub yep {
	print "1\n";
	exit;
}

sub nope {
	print "0\n";
	exit;
}
