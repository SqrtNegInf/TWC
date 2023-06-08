#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

# simplistic rotation implementation
sub num_rotate_do {
	local $_ = shift;
	my $l = length;
	my ($i, $str) = (1, $_);
	do {
		my $head = substr $_, 0, $i++ % $l, '';
		$_ .= $head;

	} until (/^$str$/);
	return $i - 1;
}

# Calculate maximum number of rotations required for given
# string length, i.e. when the string is not a repeated substring
sub max_rotate {
	my $len = shift;

	my $po2 = 2;
	$po2 *= 2 while $len % $po2 == 0;

	# $po2 is the power of 2 that is required to be a
	# factor in one of the parts $i * ($i + 1).
	# This saves a lot of checking for higher powers.
	for (my $i = $po2; 1; $i += $po2) {
		return $i - 1 if ($i - 1) * $i / 2 % $len == 0;
		return $i if $i * ($i + 1) / 2 % $len == 0;
	}
}

# Calculate number of rotations required for given string.
sub num_rotate_calc {
	local $_ = shift;

	# Shortcut for a repeated substring.
	# Expensive but necessary.
	return num_rotate_calc($1) if /^(.+)\1+$/;

	max_rotate(length);
}

# Convert a string consisting of only two different characters
# to a canonical binary representation.
# This transformation is not necessary for the computational
# approch, but comes almost for free from the input data checking.
# For the rotation implementation the string must not contain any
# regex meta characters, so this transformation is useful in this
# case.
sub binary {
	local $_ = shift;
	my ($x, $y) = /^(.)\1*(.)(?:\1*\2*)*$/;
	return unless $x;
	eval "tr/$x$y/10/";
	die $@ if $@;
	$_;
}

# Calculate number of rotations required for a given string
# to match itself.
# Selects the rotation implementation when called with
# a "true" second argument
sub rotate_to_self {
	my $n = binary(shift);
	my $rot = shift;
	return unless $n;
	if ($rot) {
		return num_rotate_do $n;
	} else {
		return num_rotate_calc $n;
	}
}

# main

# 2048 = 2 ** 11
my $l2048 = 'x' . 'y' x 2047;

# 2080 = 64 * 65 / 2 = sum 1 .. 64
my $l2080 = 'x' . 'y' x 2079;

# 2081 is prime
my $l2081 = 'x' . 'y' x 2080;

# 2128 = 16 * 7 * 19; 
my $l2128 = 'x' . 'y' x 2127;

# repeated sequence sum
my $long = ('x' . 'y' x 2079) x 2048;

is rotate_to_self('xyxx'), 7, 'calc example from challenge';
is rotate_to_self('xyxx', 1), 7, 'rot example from challenge';
is rotate_to_self($l2048), 4095, 'calc power of 2';
is rotate_to_self($l2048, 1), 4095, 'rot power of 2';
is rotate_to_self($l2080), 64, 'calc sequence sum';
is rotate_to_self($l2080, 1), 64, 'rot sequence sum';
is rotate_to_self($l2081), 2080, 'calc prime';
is rotate_to_self($l2081, 1), 2080, 'rot prime';
is rotate_to_self($long), 64, 'calc repeated substring';
is rotate_to_self($long, 1), 64, 'rot repeated substring';
is rotate_to_self('x'), U(), 'too short';

done_testing;
