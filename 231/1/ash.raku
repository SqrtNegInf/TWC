#!/usr/bin/env raku


sub solve3(@data) {
    @data.grep: * != (@data.min, @data.max).any
}

sub solve2(@data) {
    (@data.grep: * != (@data.min, @data.max).any) || -1
}

sub solve1(@data) {
    (@data.grep: * ∉ (@data.min, @data.max)) || -1
}

my @tests = (3, 2, 1, 4), (3, 1), (2, 1, 3);
say solve1($_) for @tests;
say solve2($_) for @tests;
say solve3($_) for @tests;
