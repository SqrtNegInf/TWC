#!/usr/bin/env perl
use v5.36;

sub number_of_1 {
    my $in = shift;
    my $count = 0;
    $count += $_ for split //, sprintf "%b", $in;
    return $count;
}

my $num = shift // 12;
my $target = number_of_1 $num;
while (++ $num) {
    say $num and last if $target == number_of_1 $num;
}
