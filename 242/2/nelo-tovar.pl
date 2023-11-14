#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (

    [ [ 1, 1, 0 ], 
      [ 1, 0, 1 ], 
      [ 0, 0, 0 ] 
    ],
    [ [ 1, 1, 0, 0 ], 
      [ 1, 0, 0, 1 ], 
      [ 0, 1, 1, 1 ], 
      [ 1, 0, 1, 0 ] 
    ],
);

sub reverse_matrix_rows {
    my $m1 = shift;
    my @reverse;

    foreach my $x ($m1->@*) {
        push @reverse,  [reverse $x->@*];
    }

    return \@reverse 
}

sub	invertir {
    my $m1 = shift;
    my @invert;

    foreach my $x ($m1->@*) {
        push @invert, [map {$_ == 0 ? 1 : 0} $x->@*];
    }

    return \@invert
}

for my $m (@examples) {
    my @matrix = $m->@*;

    my $reverse = reverse_matrix_rows   \@matrix;
    my $invert  = invertir $reverse;

    say 'Input  : @matrix = ', dump(@matrix);
    say 'Output :           ', dump(@$invert);
    say ' ';
}
