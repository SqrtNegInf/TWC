#!/usr/bin/env perl
use v5.36;

my @L = ( -25, -10, -7, -3, 2, 4, 8, 10 );

my $target = 0;

# a + b + c = target

# a <= b <= c

# in this case, we're given an array that's pre-sorted, so we roll
# with that.

for my $i ( 0 .. scalar @L - 1 ) {
    for my $j ( $i .. scalar @L - 1 ) {
        for my $k ( $j .. scalar @L - 1 ) {

            # sort has made me stop using $a and $b as vars
            # but I'm working with indexes anyway

            my $l = $L[$i] + $L[$j] + $L[$k];
            next unless $l == $target;
            say qq{  $L[$i] + $L[$j] + $L[$k] = $l };

        }
    }
}

