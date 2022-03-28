#!/usr/bin/env perl

use v5.30;
use warnings;

sub can_interleave {
    my ($A, $B, $C) = @_;
    ($A eq '' && $B eq '' && $C eq '')
    || (length $A && substr($A,-1) eq substr($C,-1) && can_interleave(substr($A,0,-1), $B, substr($C,0,-1)))
    || (length $B && substr($B,-1) eq substr($C,-1) && can_interleave($A, substr($B,0,-1), substr($C,0,-1)));
}

# Tests.
while (<DATA>) {
    next if /^#/;
    /(\S*)\s*(\S*)\s*(\S*)\s*([01])/;
    my ($A, $B, $C, $expected) = ($1, $2, $3, $4);
       
    say $expected == can_interleave($A, $B, $C) ;
    $expected == can_interleave($A, $B, $C) || die "Error for (A,B,C)=$A,$B,$C. Expected $expected.";
}

# Console interface.
say 0+can_interleave(@ARGV) if @ARGV;

__DATA__
# Test data of the form $A $B $C $output.
XY X XXY 1
XXY XXZ XXXXZY 1
YX X XXY 0
ABCDEF ABCCDEF AABBCCDEFCDEF 1
ABCCDEF ABCDEF AABBCCDEFCDEF 1
