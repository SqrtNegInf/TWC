#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);
use List::Util qw(max sum);

my @a = <2 1 4 5 3 7>;

# build the histogram
my $rows = max(@a);
my $cols = @a;
my @hist;
for my $col (0..$#a) {
    for my $row (0..$rows-1) {
        $hist[$row][$col] = $row < $a[$col] ? 1 : 0;
    }
}

print_hist(\@hist, \@a, $rows, $cols);

my $best_area = 0;
my $best_height = -1;
my $best_width = -1;

for my $height (1..$rows) {
    for my $width (1..$cols) {
        my $area = $height * $width;
        next if $area <= $best_area;
        for my $r0 (0..$rows-$height) {
            for my $c0 (0..$cols-$width) {
                my $sum = 0;
                for my $r ($r0..$r0+$height-1) {
                    $sum += sum($hist[$r]->@[$c0..$c0+$width-1]);
                }
                if ($sum == $area) {
                    $best_area = $area;
                    $best_height = $height;
                    $best_width = $width;
                }
            }
        }
    }
}

say "The best rectangle is $best_height x $best_width for an area of $best_area";

sub print_hist($hist, $a, $rows, $cols) {
    for (my $row = $rows-1; $row >= 0; $row--) {
        printf "%d", $row+1;
        for my $col (0..$cols-1) {
            printf " %s", $hist[$row][$col] ? '#' : ' ';
        }
        print "\n";
    }

    print "-";
    print " -" x $cols;
    print "\n";

    print " ";
    printf " %d", $a[$_] for 0..$cols-1;
    print "\n\n";
}
