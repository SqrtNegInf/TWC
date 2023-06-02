#!/usr/bin/env perl
use v5.36;

# answer is wrong?

my @A = (2,13,10,8);        # get an array of positive numbers
my $n = scalar @A;    # number of members

my $min_sum;          # minimum non-negative sum so far
my $min_sum_flips;    # minimum number of flips required to reach minimum sum

for my $M ( 0 .. ( 2**$n ) - 1 ) {

    my $m = $M;
    my @a = @A;
    my $i = 0;
    my $flips;
    while ($m) {
        if ( $m & 1 ) {    # flip each member where the is a '1' in the mask
            $a[$i] = -$a[$i];
            $flips += 1;
        }
        $m = $m >> 1;
        $i += 1;
    }

    my $sum;
    $sum += $a[$_] for 0 .. $#a;    # sum of all members

    next if $sum < 0;               # ignore negative results

    if ( not defined $min_sum or $sum <= $min_sum ) {
        $min_sum = $sum;
        if ( not defined $min_sum_flips or $flips < $min_sum_flips ) {
            $min_sum_flips = $flips;
        }
    }
}

say $min_sum_flips;
