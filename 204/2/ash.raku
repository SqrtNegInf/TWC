#!/usr/bin/env raku

sub reshape-matrix (@matrix, $r, $c) {
    my @flat = @matrix.map(*.flat).flat;
    my $total_elements = @flat.elems;
    return 0 if $total_elements != $r * $c;

    my @result;
    for ^$r -> $i {
        push @result, [@flat[$c * $i .. $c * $i + $c - 1]];
    }

    return @result.elems == 1 ?? @result[0] !! @result;
}

my @matrix = [ [ 1, 2 ], [ 3, 4 ] ];
my $r = 1;
my $c = 4;
my $result = reshape-matrix(@matrix, $r, $c);
say $result;

@matrix = [ [ 1, 2, 3 ], [ 4, 5, 6 ] ];
$r = 3;
$c = 2;
$result = reshape-matrix(@matrix, $r, $c);
say $result;

@matrix = [ [ 1 ], [ 2 ] ];
$r = 2;
$c = 1;
$result = reshape-matrix(@matrix, $r, $c);
say $result;

@matrix = [ [ 1, 2, 3 ], [ 4, 5, 6 ] ];
$r = 2;
$c = 4;
$result = reshape-matrix(@matrix, $r, $c);
say $result;
