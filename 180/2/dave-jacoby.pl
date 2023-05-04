#!/usr/bin/env perl
use v5.36;

my @inputs = (
    [ 3, [ 1, 4, 2, 3, 5 ] ],
    [ 4, [ 9, 0, 6, 2, 3, 8, 5 ] ]

);

for my $input (@inputs) {
    my $i      = $input->[0];
    my $list   = $input->[1];
    my $ls     = join ',', $list->@*;
    my @output = trim_list( $i, $list );
    my $output = join ',', @output;
    say <<END;
    Input:  \@n = ($ls) and \$i = $i
    Output: ($output)
END
}

sub trim_list ( $i, $list ) {
    my @output = grep { $_ > $i } $list->@*;
    return @output;
}
