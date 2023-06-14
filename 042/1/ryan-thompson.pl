#!/usr/bin/env perl
use v5.36;

# The following is a polyglot (runs in Perl and Raku):
printf "Decimal %2d = Octal %2o\n", $_, $_ for 0..50;

# This printf feature will be important for our Raku solution:
printf 'Decimal %1$2d = Octal %1$2o'."\n", $_ for 0..50;
