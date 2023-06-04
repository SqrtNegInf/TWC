#!/usr/bin/env perl
use v5.36;

use Math::Fibonacci;

my $input = 377;
chomp $input;

die "Invalid input, enter numbers greater than 0.\n" if $input < 0;

my @sums;
foreach my $num (0 ... $input / 2) {
    my $diff = $input - $num;
    push @sums, [$diff, $num];
}

sub is_fib { return Math::Fibonacci::isfibonacci(@_) }

foreach (@sums) {
    next unless is_fib($_->[0]) and is_fib($_->[1]);
    say "$_->[0] + $_->[1]";
}
