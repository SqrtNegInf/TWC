#!/usr/bin/env perl
use v5.36;

# Get the size of the matrix
my $size = 5;

for ( my $row = 0; $row < $size; $row++ ) {
    my (@row) = map { 0 } 1 .. $size;
    $row[$row] = 1;
    say join " ", @row;
}
