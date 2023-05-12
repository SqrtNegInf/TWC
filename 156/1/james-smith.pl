#!/usr/bin/env perl
use v5.36;

use Test::More;

my %primes = map { $_ => 1 } 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37;

my$n=0;

$n++, exists $primes{(sprintf '%b', $n)=~tr/1/1/} ? (say $n) : redo for 1..10;

