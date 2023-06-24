#!/usr/bin/env perl
use v5.36;

my $nb_rows = 10;
my @row = (1);
for (1 .. $nb_rows) {
    say "@row";
    my @temp = (0, @row, 0);
    @row = ();
    for my $index (0 .. $#temp -1) {
        push @row, $temp[$index] + $temp[$index + 1];
    }
}
