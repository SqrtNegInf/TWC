#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub rotate {
    my ($angle) = @_;
    my @matrix = (
        [ 1, 2, 3 ],
        [ 4, 5, 6 ],
        [ 7, 8, 9 ],
    );

    my $side = scalar @matrix;

    for (1 .. $angle / 90) {
        for my $row (0 .. ($side / 2) - 1) {
            for my $col ($row .. ($side - $row - 1) - 1) {
                my $temp = $matrix[$row][$col];

                $matrix[$row][$col] = $matrix[$side - 1 - $col][$row];

                $matrix[$side - 1 - $col][$row] =
                    $matrix[$side - 1 - $row][$side - 1 - $col]; 

                $matrix[$side - 1 - $row][$side - 1 - $col] =
                    $matrix[$col][$side - 1 - $row]; 

                $matrix[$col][$side - 1 -$row] = $temp;
            }
        }
    }

    return @matrix;
}

my $angle = 90; #shift // usage();

if ($angle != 90 && $angle != 180 && $angle != 270) {
    usage();
}

for my $row (rotate($angle)) {
    say '[ ', (join(q{, }, @{ $row })), ' ]';
}
