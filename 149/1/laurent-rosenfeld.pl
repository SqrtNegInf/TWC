#!/usr/bin/env perl
use v5.36;

sub fib_digit_sum {
    my $max = shift || 20;
    my @fib = (0, 1);
    my $count = 1;
    while ($count < 100) {
        push @fib, $fib[-1] + $fib[-2];
        $count ++;
    }
    my %fibo = map { $_ => 1 } @fib;
    my @numbers;
    my $count_result = 0;
    my $i = 0;
    while ($count_result < $max) {
        my $sum = 0;
        $sum += $_ for split //, $i;
        if (exists $fibo{$sum}) {
            push @numbers, $i;
            $count_result++;
        }
        $i++
    }
     say "@numbers";
}

fib_digit_sum(shift);
