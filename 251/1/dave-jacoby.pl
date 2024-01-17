#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum0 };

my @examples = (

    [ 6,  12, 25, 1 ],
    [ 10, 7,  31, 5, 2, 2 ],
    [ 1,  2,  10 ],
);

for my $example (@examples) {
    my $input  = join ', ', $example->@*;
    my $output = kinda_concatenation( $example->@* );

    say <<~"END";
    Input:  \$ints = ($input)
    Output: $output
    END
}

sub kinda_concatenation (@input) {
    my @output;
    while (@input) {
        if ( scalar @input == 1 ) {
            push @output, shift @input;
        }
        else {
            my $concat = join '', shift @input,  pop @input;
            push @output, $concat;
        }
    }
    return sum0 @output;
}
