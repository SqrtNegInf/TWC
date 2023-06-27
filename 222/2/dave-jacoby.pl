#!/usr/bin/env perl
use v5.36;

my @examples = ( 
    [ 2, 7, 4, 1, 8, 1 ], 
    [1], 
    [ 1, 1 ],
);

for my $example (@examples) {
    my $output = last_member( $example->@* );
    my $e = join ', ', $example->@*;
    say <<~"END";
        Input: \@ints = ($e);
        Output: $output
    END
}

sub last_member( @ints) {
    while ( scalar @ints > 1 ) {
        @ints = reverse sort @ints;
        my $x = shift @ints;
        my $y = shift @ints;
        push @ints, $x - $y if $x != $y;
    }
    return scalar @ints;
}
