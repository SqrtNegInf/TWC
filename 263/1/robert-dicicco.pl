#!/usr/bin/env perl
use v5.36;

my @myints = ([1, 5, 3, 2, 4, 2],[1, 2, 4, 3, 5],[5, 3, 2, 4, 2, 1]);
my @idx = (2,6,4);

my $ln = scalar @myints;
my $cnt = 0;
my @fnd;

while ($cnt < $ln){
    say "Input: @{$myints[$cnt]}";
    my @arr = sort(@{$myints[$cnt]});
    my $ln = scalar @arr;
    my $x = 0;
    while ($x < $ln){
        if ($arr[$x] == $idx[$cnt]) {
            push (@fnd, $x);
        }
        $x++;
    }
    say "Output: \(@fnd\)\n";
    @fnd = ();
    $cnt++;
}
