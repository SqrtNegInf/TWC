#!/usr/bin/env perl
use v5.36;

my $input = lc join q{ }, <The quick brown fox jumps over the lazy dog>;
$input =~ s/\s+//gmx;
my @rows;
while (length $input) {
    push @rows, substr $input, 0, 8, q{};
}

my @cols;
for my $row (@rows) {
    my @chars = split //, $row;
    for my $i (0 .. 7) {
        if ($chars[$i]) {
            $cols[$i] .= $chars[$i];
        }
    }
}

say join q{ }, @cols;

