#!/usr/bin/env perl
use v5.36;

my $N = shift || 3;
say join(', ', paths($N));

sub paths {
    my($size) = @_;
    my @paths;
    find_paths(\@paths, $size, '', 0, 0);
    return @paths;
}

sub find_paths {
    my($paths, $size, $path, $row, $col) = @_;
    if ($row == $size && $col == $size) {   # reached end
        push @$paths, $path;
    }
    else {
        if ($row < $size) {
            find_paths($paths, $size, $path.'L', $row+1, $col);
            find_paths($paths, $size, $path.'R', $row+1, $col+1);
        }
        if ($col < $row) {
            find_paths($paths, $size, $path.'H', $row, $col+1);
        }
    }
}
