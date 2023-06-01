#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub all {
    my @array = @_;

    for (@array) {
        if ($_ != 1) {
            return undef;
        }
    }

    return 1;
}

my @matrix = (
[0,0,0,1,0,0],
[1,1,1,0,0,0],
[0,0,1,0,0,1],
[1,1,1,1,1,0],
[1,1,1,1,1,0],
);
my $maxwidth = 0;
my $maxheight = 0;

for my $m (0 .. scalar @matrix - 1) {
    for my $n (0 .. scalar @{$matrix[$m]} - 1) {
        if (@{$matrix[$m]}[$n] == 1) {
            my $row = $m;
            my $col = $n;
            my $left = $n;
            my $height = 0;
            my $width = 0;
            while ($col < scalar @{$matrix[$row]} && @{$matrix[$row]}[$col] == 1) {
                $width++;
                $col++;
            }

            while ($row < scalar @matrix && all(@{$matrix[$row]}[$left .. $left + $width - 1])) {
                $height++;
                $row++;
            }

            if ($height * $width > $maxheight * $maxwidth) {
                $maxheight = $height;
                $maxwidth = $width;
            }
        }
    }
}

if ($maxheight * $maxwidth < 2) {
    say '0';
} else {
    for (0 .. $maxheight - 1) {
        say q{[ }, "1 " x $maxwidth, q{]};
    }
}
