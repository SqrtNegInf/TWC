#!/usr/bin/env perl
use v5.36;

my @allints = ([1, 1, 4, 2, 1, 3],[5, 1, 2, 3, 4],[1, 2, 3, 4, 5]);

for my $ints (@allints) {
    my $flag = 0;
    my @original = @$ints;
    my @sorted = sort(@original);
    my $cnt = scalar (@original);
    for (my $digit=0; $digit < $cnt; $digit++){
        if ($original[$digit] == $sorted[$digit]) {
            $flag++;
        }
    }
    say "Output: $flag\n";
}
