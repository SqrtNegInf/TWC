#!/usr/bin/env raku

my @n = [1, 3, 5, 7, 9 ]; #prompt('Input: @n = ').comb(/\d+/)>>.Int;
my $equilibrium-index is default(-1) = (^@n).first({ @n[^$_].sum == @n[$_^..*].sum });
say "Output: $equilibrium-index";
