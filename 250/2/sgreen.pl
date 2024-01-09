#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

sub calculate_value ($s) {
    #Return the number if it looks like an integer else the length of string
    return $s =~ /^[0-9]+$/ ? int($s) : length($s);
}

sub main (@values) {
    say max( map { calculate_value($_) } @values );
}

main(<perl 2 r4ku>);
