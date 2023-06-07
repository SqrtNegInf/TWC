#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);

# Default $m and $n
my $m = shift // 5;
my $n = shift // 3;

# Answers
my @combinations = numeric_combinations($m, $n);
say answer_to_string(\@combinations);

sub numeric_combinations {
	my ($m, $n) = @_;
	my @data = (1 .. $m);

	# Possible combinations
	return my @all_combinations
		= combinations(\@data, $n);
}

# Flaten to answer array to a string
sub answer_to_string {
	my $combinations = shift;
	return
	'[ ' .
		(
			join ', ',
			map {
				'[' .
				(join ', ', @$_) .
				']'
			} @$combinations
		) .
	' ]';
}
