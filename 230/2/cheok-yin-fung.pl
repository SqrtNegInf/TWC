#!/usr/bin/env perl
use v5.36;

sub cw {
    my @words = $_[0]->@*;
    my $prefix = $_[1];
    my $ans = map { $_ =~ /^$prefix/} @words;
}

use Test::More tests=>2;
ok cw(["pay", "attention", "practice", "attend"], "at") == 2;
ok cw(["janet", "julia", "java", "javascript"], "ja") == 3;
