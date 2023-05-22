#!/usr/bin/env raku

my @matrix = <3 1 2 5 2 4 0 1 3>,<2 1 4 5>,<1 0 3 0 0 0 1 2 1>;

for (@matrix) -> @sub {
    say "Input: \@matrix = ",@sub;
    say "Output: ", @sub.sort[2];
}
