#!/usr/bin/env perl
use v5.36;

my ($a, $b, $c, $n, $s, @solutions);

# input n
#print qq[n: ];
$n = 60;
chomp($n);

# If c == n:
# a < b so a**2 < n**2 / 2, so we only need to test values of a < sqrt(n**2 / 2)
# and solutions are where n**2 - a**2 is an integer square (ie b**2)

for $a (1 .. int(sqrt($n**2 / 2))) {
	$solutions[$s++] = qq[    ($a, $b, $n)\n] if $b = is_a_square($n**2 - $a**2);
}

# If a == n:
# We are looking for b and c such that c**2 - b**2 == n**2.  
# if t == s + 1 then t**2 - s**2 is 2s + 1, so we only
# need to test values of b where 2b + 1 < n**2
# and solutions are where n**2 - b**2 is an integer square (ie a**2)

for $b (1 .. 2**32) {
	last if 2 * $b + 1 > $n**2;
	$solutions[$s++] = qq[    ($n, $b, $c)\n] if $c = is_a_square($n**2 + $b**2);	
}

# solutions
print qq[Input: \$N = $n\nOutput:\n];
for $s (@solutions) { print $s };
print qq[-1\n] unless (scalar @solutions);

#---

sub is_a_square {
	my $test = sqrt($_[0]);
	return $test == int($test) ? $test : 0;
}
