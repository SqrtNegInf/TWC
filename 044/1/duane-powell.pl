#!/usr/bin/env perl
use v5.36;

use Math::BaseCalc;

my $n   = shift || "123456789";
my $sum = shift || 100;

my @n = split(//,$n);
my %operator = (
	0 => '',
	1 => '+',
	2 => '-',
);

my $comb = 3 ** ((scalar @n) -1);  # 6561 combinations for 123456789
my $calc = Math::BaseCalc->new(digits => [0,1,2]); 
foreach (0 .. $comb-1) { # zero indexed
	my @op = split(//,sprintf "%08d", $calc->to_base($_));
	my $e;
	# zipper together the two arrays (@n and @op) building str $e, for example 1+2+3+4+5+6+7+8+9 
	foreach my $n (@n) {
		if (scalar @op) {
			my $op = pop @op;
			$e .= $n . $operator{$op};
		}
		else {
			$e .= $n;
		}
	}
	my $s = eval $e;
	say "$e = $sum" if ( $s == $sum );
}
