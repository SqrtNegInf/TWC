#!/usr/bin/env perl
use v5.36;

my @examples = (

    [ 5, 2, 1, 6 ],
    [ 1, 2, 0, 3 ],
    [ 0, 1 ],
    [ 9, 4, 9, 2 ],
);

for my $example (@examples) {
    my @output = smaller_than( $example->@* );
    my $input  = join ', ', $example->@*;
    my $output = join ', ', @output;

    say <<~"END";
    Input:  \@ints = ($input)
    Output: ($output)
    END
}

sub smaller_than (@ints) {
    return map {
        my $i = $_;
        scalar grep { $_ < $i } @ints;
    } @ints;
}
