#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

sub max_words {
    my $max = 0;
    for my $sentence (@_) {
        my $cw = scalar split /\s+/, $sentence;
        $max = $cw if $cw > $max;
    }
    return $max;
}

my @tests = (
    ["The quick brown fox jumps over the lazy dog",
        "Lorem ipsum dolor sit amet"],
    ["Perl and Raku belong to the same family.",
        "I love Perl.",
        "The Perl and Raku Conference."],
    ["The Weekly Challenge.",
        "Python is the most popular guest language.",
        "Team PWC has over 300 members."]);
for my $test (@tests) {
    say max_words @$test;
}
