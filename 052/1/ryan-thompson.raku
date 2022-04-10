#!/usr/bin/env raku

my @step;
for (1..9) -> $n {
    @step.push: |map { $n ~ ($n+1..$_)        .join: '' }, $n..9;
    @step.push: |map { $n ~ ($_..$n-1).reverse.join: '' },  0..$n-1;
}

say @step».Int.grep( 100 ≤ * ≤ 999 ).sort;
