#!/usr/bin/env perl
use v5.36;

my ($n, $string, @lf, @fac);

# assume !1 and 1!
$lf[1] = 1;
$fac[1] = 1;
$string = qq[1, ];

# calculate the rest as per the third comment line above
for $n (2 .. 10) {
	$lf[$n] = $lf[$n - 1] + $fac[$n - 1];
	$fac[$n] = $fac[$n - 1] * $n;
	$string .= qq[$lf[$n], ];
}
say substr($string, 0, -2);
