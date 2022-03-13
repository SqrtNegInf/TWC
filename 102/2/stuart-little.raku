#!/usr/bin/env raku
use v6;

# run <script> <number>

sub hshCount($n) {
    $n == 0 && return "";
    $n == 1 && return "#";
    my $stub = qq{$n} ~ "#";
    return hshCount($n-$stub.chars) ~ $stub;
}

say hshCount(20)
