#!/usr/bin/env perl
use v5.36;

sub is_ugly {
    my $in = shift;
    for my $div (2, 3, 5) {
        $in /= $div while $in % $div == 0;
    }
    return $in == 1;
}

my $n = shift // 150;
my $i = 0;
my $count = 0;
while (1) {
    $count ++;
    $i++ if is_ugly $count;
    say $count and last if $i == $n
}
