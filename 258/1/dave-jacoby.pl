#!/usr/bin/env perl
use v5.36;

my @examples = (

    [ 10,  1, 111, 24, 1000 ],
    [ 111, 1, 11111 ],
    [ 2,   8, 1024, 256 ],
);

for my $example (@examples) {
    my $output = scalar grep { ( length $_ ) % 2 == 0 } $example->@*;
    my $ints   = join ', ', $example->@*;

    say <<~"END";
    Input:  \@ints = ($ints)
    Output: $output
    END
}

