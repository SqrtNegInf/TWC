#!/usr/bin/env perl
use v5.36;
use List::MoreUtils 'minmax';
use Math::Utils 'floor';


### Input and Output

binmode STDOUT, ':utf8';
say barchart((15,2500,35,-4500,55,65,75,8500));


### Implementation

# A vague solution for a vague task:  I didn't find any Unicode
# symbols that could be used to produce sparklines.  Using
# ${SEARCH_ENGINE} revealed some implementations that produce small
# bar charts using Unicode symbols.  Following this approach.
#
# Starting with U+2581 ("\N{LOWER ONE EIGHTH BLOCK}"), there are eight
# consecutive block symbols having a height of one to eight eights that
# will be used here.  Returning a list of characters.

sub barchart {
    my ($min, $max) = minmax @_;
    my $scale = 7.999 / (($max - $min) || 1);
    map chr(0x2581 + floor(($_ - $min) * $scale)), @_;
}
