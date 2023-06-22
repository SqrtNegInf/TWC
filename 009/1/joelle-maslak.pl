#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniqnum);

while (1) {
    state $num = 99;
    $num++;

    my $square = $num * $num;
    next if (join '', sort split '', $square) ne (join '', uniqnum sort split '', $square);

    say $square;
    exit;
}

