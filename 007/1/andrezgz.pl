#!/usr/bin/env perl
use v5.36;

#0 is not a niven number because it in not divisible by 0. So I start with 1.
use List::Util qw(sum);
map { CORE::say unless ( $_ % sum(split //) ) } (1..50);
