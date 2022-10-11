#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my (@tests, $test);

@tests = ('1ac2.34f0.b1c2', 'abc1.20f1.345a');

# just do it
for $test (@tests) {
	say $test =~ m|^(..)(..).(..)(..).(..)(..)$| ? qq[\nInput:  $test\nOutput: $1:$2:$3:$4:$5:$6]: 'Invalid format';
}
