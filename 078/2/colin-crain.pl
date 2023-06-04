#!/usr/bin/env perl
use v5.36;


my @array = (7, 4, 2, 6, 3);
my @idxs  = (1, 3, 0, 4);
my @output;
my $end = scalar @array - 1;

for my $idx (@idxs) {
    $idx == 0 and do {(push @output, \@array); next};
    my @shifted = @array[$idx..$end, 0..$idx-1];
    push @output,  \@shifted ;
}

say "array:      (", (join ', ', @array), ")";
say "index list: (", (join ', ', @idxs ), ")\n";

say "[", (join ' ', $_->@*), "]" for @output;

