#!/usr/bin/env perl
use v5.36;

my $numbers = '123456789';
check_numbers('', $numbers, 100);

sub check_numbers {
    my ($n, $nums, $goal) = @_;

    if ($nums) {
        my ($n2, $new_numbers) = split('', $nums, 2);
        check_numbers($n . '+' . $n2, $new_numbers, $goal);
        check_numbers($n . '-' . $n2, $new_numbers, $goal);
        check_numbers($n . $n2, $new_numbers, $goal);
    } else {
        my $total = eval $n;
        say $n if ($total == $goal)
    }
}
