#!/usr/bin/env perl
use v5.36;

use List::Util qw(min max);

my $L = $ARGV[0] || "2, 1, 4, 5, 3, 7";

my $list = prepare($L);
print chart($list), "\n\n";
print "Largest Rectangle Histogram: ", largest_rectangle_histogram($list), "\n";

#
#
# METHODS

sub largest_rectangle_histogram {
    my ($list) = @_;

    my $i   = 0;
    my $max = 0;
    foreach my $n (@$list) {

        my ($left, $right) = (0, 0);
        $left  = go_left($i, $list)  if ($i > 0);
        $right = go_right($i, $list) if ($i <= $#$list);

        my @heights = (@$list)[$i - $left .. $i + $right];
        my $size    = min(@heights) * @heights;
        $max = $size if ($size > $max);

        $i++;
    }

    return $max;
}

sub go_left {
    my ($i, $list) = @_;

    my $c = $list->[$i];
    my $j = 0;
    while ($i > 0) {
        $i--;
        last if ($list->[$i] < $c);
        $j++;
    }

    return $j;
}

sub go_right {
    my ($i, $list) = @_;

    my $c = $list->[$i];
    my $j = 0;
    while ($i < $#$list) {
        $i++;
        last if ($list->[$i] < $c);
        $j++;
    }

    return $j;
}

sub chart {
    my ($list) = @_;

    my $max   = max(@$list);
    my $chart = [];
    my $row   = 1;
    foreach (1..$max) {
        my $data = "";
        foreach my $i (0..$#$list) {
            if ($row <= $list->[$i]) {
                $data .= " #";
            }
            else {
                $data .= "  ";
            }
        }
        $row++;
        push @$chart, sprintf("%d%s", $_, $data);
    }

    my ($histogram, $line, $size) = ("", "", "  ");
    $histogram = join "\n", (reverse @$chart);
    $line .= "_ " for (0..$#$list + 1);
    $size .= join " ", @$list;

    return join "\n", $histogram, $line, $size;
}

sub prepare {
    my ($list) = @_;

    if (defined $list) {
        $list =~ s/\s//g;
        return [ split /\,/, $list ];
    }
}
