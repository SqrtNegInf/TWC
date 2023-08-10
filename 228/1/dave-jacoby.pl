#!/usr/bin/env perl
use v5.36;

use List::Util qw( sum0 );

my @examples = (

    [ 2, 1, 3, 2 ],
    [ 1, 1, 1, 1 ],
    [ 2, 1, 3, 4 ],
);

for my $e (@examples) {
    my @array = $e->@*;
    my $array = join ', ', @array;
    my $sum   = uniq_sum(@array);
    say <<~"END";
    Input:  \@int = ($array)
    Output: $sum
    END
}

sub uniq_sum (@array) {
    my %hash;
    for my $int (@array) {
        $hash{$int}++;
    }
    return sum0 grep { $hash{$_} == 1 } keys %hash;
}
