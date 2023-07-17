#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

my @S = ("Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference.");
say join "\n", @S, " -> ", max map {0+@{[split " "]}} @S;
