#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/is_square/;

my $n  = shift // 60;
my $n2 = $n * $n;

# Avoid duplicates, so store them in a hash keyed on either of the other
# members of the triple.
my %triples;

# n squared could be the sum of 2 squares or the difference of 2 squares

# Sum. Count downwards from n.
my $go = $n;
while (--$go > 4) {
	next if exists $triples{$go};
	my $sqdiff = $n2 - $go * $go;
	store_if_sq (\%triples, $sqdiff, $n, $go);
}

# Difference. Count upwards from n.
$go = $n;
my $oldgo2 = $n2;
while (1) {
	my $go2 = ++$go * $go;
	last if $n2 < ($go2 - $oldgo2);
	my $sqdiff = $go2 - $n2;
	store_if_sq (\%triples, $sqdiff, $n, $go);
	$oldgo2 = $go2;
}

unless (scalar keys %triples) {
	print "-1\n";
	exit;
}

print "(@{$triples{$_}})\n" for sort keys %triples;
#print "(@$_)\n" for sort values %triples;

sub store_if_sq {
	my ($tri, $sqdiff, @rest) = @_;
	return unless is_square ($sqdiff);
	my $diff = sqrt $sqdiff;
	$tri->{$diff} = [$diff, @rest];
}
