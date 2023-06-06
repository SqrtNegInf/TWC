#!/usr/bin/env perl
use v5.36;

sub min {
    my $min = shift;
    for (@_) {
        $min = $_ if $_ < $min;
    }
    $min;
}

my @a = (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
my $s =  shift // 3;
my @result;
for my $i (0..@a - $s) {
    push @result, min @a[$i..$i + $s - 1];
}
say "@result";
