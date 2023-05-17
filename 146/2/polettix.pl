#!/usr/bin/env perl
use v5.36;

my $member = shift // '4/3';
my $parent = parent_of($member);
my $grandparent = parent_of($parent);
say "parent = '$parent' and grandparent = '$grandparent'";

sub parent_of ($frac) {
   my ($num, $den) = split m{/}mxs, $frac;
   join '/', $num < $den ? ($num, $den - $num) : ($num - $den, $den);
}
