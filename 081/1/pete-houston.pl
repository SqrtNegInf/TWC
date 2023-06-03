#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'gcd';

# Find longest possible substring
my @str     = <abcdabcd abcdabcdabcdabcd>;
my @len     = map { length } @str;
my $longest = gcd (@len);

# Count up
my $ans;
LENGTH:
for my $i (1 .. $longest) {
	my $substr = substr ($str[0], 0, $i);
	last unless substr ($str[1], 0, $i) eq $substr;
	for my $j (0, 1) {
		next LENGTH if $len[$j] % $i;
		next LENGTH if $str[$j] ne $substr x ($len[$j] / $i);
	}
	$ans = $substr;
}

$ans //= 'No common base string';
print "$ans\n";
