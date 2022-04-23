#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;
use utf8;

my (@numbers, $n, $string, $length, $k, $this, $next);

@numbers = qw(x one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen
	seventeen eighteen nineteen twenty);

for $n (1 .. $#numbers) {
	$string = '';
	
	$this = $n;
	for $k (1 .. 20) {
		$next = length($numbers[$this]);
		$string .= qq[$numbers[$this] is $numbers[$next], ];
		last if $next == 4;
		$this = $next;
	}
	$string = ucfirst($string);
	say qq[\nInput:  \$n = $n\nOutput: ${string}four is magic.];
}
