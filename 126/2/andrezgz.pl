#!/usr/bin/env perl
use v5.36;

my $rows = [
    [qw/x * * * x * x x x x/],
    [qw/* * * * * * * * * x/],
    [qw/* * * * x * x * x */],
    [qw/* * * x x * * * * */],
    [qw/x * * * x * * * * x/]
];

my $max_row = $rows->@* - 1;
my $max_col = $rows->[0]->@* - 1;

for my $r (0 .. $max_row) {
    for my $c (0 .. $max_col) {
        my $output = $rows->[$r]->[$c];
        if ($output eq '*') {
            $output = 0;
            for (-1,0,1) {
                my $x = $r + $_;
                next if $x < 0 || $x > $max_row;
                for (-1,0,1) {
                    my $y = $c + $_;
                    next if $y < 0 || $y > $max_col;
                    $output++ if $rows->[$x]->[$y] eq 'x';
                }
            }

        }
        print $output,' ';
    }
    print "\n";
}
