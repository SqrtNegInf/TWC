#!/usr/bin/env perl
use v5.36;

use List::Util qw( sum0 );

my @examples = (

[1, 34, 5, 6],
[1, 24, 51, 60],
);

for my $e (@examples) {
    my @input  = $e->@*;
    my $input = join ', ', @input;
    my @output = map { split // } @input;
    my $output = join ', ', @output;
    say <<~"END";
    Input:  \@ints = ($input)
    Output: ($output)
    END
}

