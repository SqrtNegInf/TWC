#!/usr/bin/env raku
# -*- Mode: Raku; indent-tabs-mode: nil; coding: utf-8 -*-
# vim: set et ts=4 sw=4:

unit sub MAIN;
my @matrix = qw/O O X/,
             qw/X O O/,
             qw/X O O/;

my $cnt = 0;
say "Input: (Ctrl-D or Ctrl-Z to finish to input.)";

with @matrix {
    say "{.Array.raku}" for $_;
    say "";
    for 0 .. .end -> $r {
        for 0.. .[0].end -> $c {
            next if .[$r][$c] ne 'X';
            if 1 == (-1..1).map(
                -> $dy
                { | (-1..1).map(
                        -> $dx
                        {  .[$r+$dy]:exists
                            and .[$r+$dy][$c+$dx]:exists
                                ??.[$r+$dy][$c+$dx] !!'O' })}).
            grep('X').elems {
                say "{++$cnt}: Lonely X at Row {$r+1}, Col {$c+1}";
                }
        }
    }
}
