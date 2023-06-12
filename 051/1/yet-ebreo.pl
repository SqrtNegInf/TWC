#!/usr/bin/env perl
use v5.36;

#Solution from the wikipage
sub get_triplets {
    my ($list, $target) = @_;

    my @sorted = sort { $a - $b } @{$list};

    for my $i (0..@sorted-2) {
        my $a = $sorted[$i];
        my $start = $i + 1;
        my $end = @sorted - 1;

        while ($start < $end) {
            my $b = $sorted[$start];
            my $c = $sorted[$end];

            if ($a + $b + $c == $target) {
                say "$a $b $c";
                $start++;
                $end--;
            } elsif ($a + $b + $c > $target) {
                $end--;
            } else {
                $start++;
            }
        }
    }
}
my @L       = [25, -10, -7, -3, 2, 4, 8, 10];
my $target  = 0;
get_triplets(@L, $target);
