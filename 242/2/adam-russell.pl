#!/usr/bin/env perl
use v5.36;

use Data::Dump q/pp/;
sub flip_matrix{
    return map { 
        my $row = $_;
        [map {~$_ & 1} reverse @{$row}]
    } @_;
}

MAIN:{
    my @matrix = ([1, 1, 0], [1, 0, 1], [0, 0, 0]);
    say pp flip_matrix @matrix;
    @matrix = ([1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]);
    say pp flip_matrix @matrix;
}
