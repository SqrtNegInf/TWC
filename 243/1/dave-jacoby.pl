#!/usr/bin/env perl
use v5.36;

use List::Compare;

my @examples = (

    [ 1, 3, 2, 3, 1 ],
    [ 2, 4, 3, 5, 1 ],
);
for my $e (@examples) {
    my $output = reverse_pairs( $e->@* );
    my $input  = join ', ', $e->@*;
    say <<~"END";
    Input:  \@input = ($input)
    Output: $output
    END
}

sub reverse_pairs (@input) {
    my $output = 0;
    for my $i ( 0 .. -1 + scalar @input ) {
        my $ii = $input[$i];
        for my $j ( $i + 1 .. -1 + scalar @input ) {
            my $jj = $input[$j];
            $output++ if $ii > $jj * 2;
        }
    }
    return $output;
}
