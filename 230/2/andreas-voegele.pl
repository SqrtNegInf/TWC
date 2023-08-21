#!/usr/bin/env perl
use v5.36;

sub filter_words ($prefix, @words) {
    my $n = length $prefix;
    return grep { $prefix eq substr $_, 0, $n } @words;
}

say scalar filter_words('at', qw(pay attention practice attend));
say scalar filter_words('ja', qw(janet julia java javascript));
