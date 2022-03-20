#!/usr/bin/env raku

my @test = @*ARGS.elems > 0 ?? @*ARGS !! < tops opt bat pots saw tab pot top stop opts was x>;

my %words;
for @test -> $w {
    push %words, ([~] $w.comb.sort), $w;
}
for sort keys %words -> $k {
    say '[' ~ "%words{$k}" ~ ']';
}
