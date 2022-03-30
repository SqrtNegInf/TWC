#!/usr/bin/env raku

for 1..∞ -> UInt $i {
    { say $i; last; } unless (5, 2, -2, 0).grep: * == $i;
    #{ say $i; last; } unless $i (elem) @*ARGS.Set;
}
