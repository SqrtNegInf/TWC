#!/usr/bin/env perl
use v5.36;

use List::Util qw{ min max };
use Math::Combinatorics;

my @examples = (

    [ 2, 1, 4 ],
);

for my $e (@examples) {
    my $input  = join ', ', $e->@*;
    my $output = group_hero( $e->@* );

    say <<~"END";
    Input:  \$input = ($input)
    Output:          $output
    END
}

sub group_hero (@input) {
    my $output = 0;
    for my $c ( 1 .. scalar @input ) {
        my $comb = Math::Combinatorics->new( count => $c, data => [@input], );
        while ( my @combo = $comb->next_combination ) {
            my $min = min @combo;
            my $max = max @combo;
            my $str = $max**2 * $min;
            $output += $str;
        }
    }
    return $output;
}
