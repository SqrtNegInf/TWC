#!/usr/bin/env perl
use v5.36;

sub special_notes($source, $target) {
    for my $char (split //, $target) {
        return unless $source =~ s/$char//;
    }
    return 1
}

sub special_notes_optimised($source, $target) {
    my %count;
    ++$count{$_} for split //, $source;
    $count{$_}-- || return for split //, $target;
    return 1
}

use Test::More tests => 6;

for my $special_notes (\&special_notes,
                       \&special_notes_optimised
) {
    ok ! $special_notes->('abc', 'xyz'), 'Example 1';
    ok $special_notes->('scriptinglanguage', 'perl'), 'Example 2';
    ok $special_notes->('aabbcc', 'abc'), 'Example 3';
}
