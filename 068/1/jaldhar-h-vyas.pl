#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no-match-vars /;

my $M = shift // 3;
my $N = shift // 3;
my @input =  ([0, 1, 0, 1] ,[ 1, 0,1, 1] ,[1, 1, 1, 1]);

#my @input = map {[ splice @matrix, 0, $N ]} (0 .. ($M - 1));
my @output = map { [ map { $_ } @{$_} ] } @input;

for my $row (0 .. ($M - 1)) {
    if (grep { $_ == 0 } @{$input[$row]}) {
        for my $col (0 .. ($N - 1)) {
            $output[$row][$col] = 0;
        }
    }
}

for my $col (0 .. ($N - 1)) {
    for my $row (0 .. ($M - 1)) {
        if ($input[$row][$col] == 0) {
            for my $zrow (0 .. ($M - 1)) {
                $output[$zrow][$col] = 0;
            }
            last;
        }
    }
}

for my $row (@output) {
    say q{[}, (join q{ }, @{$row}), q{]};
}
