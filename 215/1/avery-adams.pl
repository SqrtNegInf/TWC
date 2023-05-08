#!/usr/bin/env perl
use v5.36;

my $removed = 0;
foreach (('abc', 'xyz', 'tsu')) {if ($_ ne join('', sort(split(//, $_)))) {$removed++}}
say $removed;
