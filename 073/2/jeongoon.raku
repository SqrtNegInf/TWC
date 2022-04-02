#!/usr/bin/env raku
# -*- Mode: Raku; indent-tabs-mode: nil; coding: utf-8 -*-
# vim: set et ts=4 sw=4:

role zero { method raku { "0" } }

sub process-smallest ( @list ) {
    my $smallest = Nil;
    @list.map(
        # always return minimum value (current one inclusive)
        # but when call with .raku return what Task #2 asks.
        -> $c {
            if $smallest.defined.not or $c < $smallest {
                $smallest = $c;
                $c but zero
            } else {
                $smallest < $c ?? $smallest !! $c but zero
            }
        });
}

my @sample = (7, 8, 3, 12, 10);
say "Input: {@sample.raku}";
my @answer = process-smallest( @sample );
say "Output: {@answer.map( *.raku ).map( *.Int ).Array.raku}";
