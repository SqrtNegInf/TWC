#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

my @S = ("Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference.");

say max map { scalar(split m{\s+}mxs) } @S;
