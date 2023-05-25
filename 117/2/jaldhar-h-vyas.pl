#!/usr/bin/env perl
use v5.36;

sub makePath {
    my ($currRow, $currCol, $endRow, $endCol, $path) = @_;

    if ($currRow == $endRow && $currCol == $endCol) {
        say $path;
        return;
    }

    # go left
    if ($currRow < $endRow) {
        makePath($currRow + 1, $currCol, $endRow, $endCol, $path . 'L');
    }

    # go horizontal
    if ($currCol < $currRow) {
        makePath($currRow, $currCol + 1, $endRow, $endCol, $path . 'H');
    }

    # go right
    if ($currRow < $endRow && $currCol < $endCol) {
        makePath($currRow + 1, $currCol + 1, $endRow, $endCol, $path . 'R');
    }
}

my $N = shift // 3;
makePath(0, 0, $N, $N, q{});
