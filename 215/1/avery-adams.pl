#!/usr/bin/env perl

use strict;
use v5.24;

my $removed = 0;
foreach (('abc', 'xyz', 'tsu')) {if ($_ ne join('', sort(split(//, $_)))) {$removed++}}
say $removed;
