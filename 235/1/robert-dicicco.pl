#!/usr/bin/env perl
use v5.36;

my @myints = ([0, 2, 9, 4, 6],[5, 1, 3, 2],[2, 2, 3]);

for my $mints (@myints) {
    say "Input: \@ints = [@$mints]";
    my $len = scalar @$mints;
    my $cnt = 0;
    my $x = 1;
    while($x < $len) {
        if (@$mints[$x] > @$mints[$x - 1]) {
            say "\t@$mints[$x] greater than @$mints[$x - 1]";
            $x++;
        } else {
            say "\t@$mints[$x] less than @$mints[$x - 1]";
            $cnt++;
            $x++;
        }
    }
    $cnt == 1 ? say "Output: true\n" : say "Output: false\n";
}
