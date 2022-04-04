#!/usr/bin/env raku

my @matrix = [1 xx 11] xx 11;

@matrix[5][5] = 0;

my %rows;
my %cols;

for @matrix.keys -> $r { 
    for @matrix[0].keys -> $c {
        if @matrix[$r][$c] == 0 {
            %rows{$r} = True;
            %cols{$c} = True;
        }
    }
}

@matrix[$_] = [0 xx @matrix[0]] for %rows.keys;
@matrix.map(-> $r {$r[$_] = 0}) for %cols.keys;

say @matrix.join("\n");
