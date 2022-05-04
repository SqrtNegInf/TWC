#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Carp;

# Identity matrices In exist for all nxn square matrices where n > 0
# Simply take an n and generate a matrix with 1's along the diagonal
# ie, 1 @ position i for 0 ≤ i < n (in 0-indexed arrays)
sub ident_mat {
    my $n = shift or croak "Must supply an value for size of square matrix";

    # Force integer
    $n = int $n;
    my @i_mat = ();

    for my $i ( 0 .. $n - 1 ) {
        my @a = (0) x $n;
        $a[$i] = 1;
        push @i_mat, \@a;
    }

    return \@i_mat;
}

my $n = 5;
my $i_mat = ident_mat($n);

say "Identity matrix for an $n x $n square matrix";
for my $i ( 0 .. $n - 1 ) {
    say join( " ", @{ $i_mat->[$i] } );
}
