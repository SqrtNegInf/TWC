#!/usr/bin/env perl
use v5.36;
#use 5.010;
#use strict;
#use warnings;
use utf8;

sub is_five_smooth_number {
    my $number = shift;

    die "Must be positive integer" if ($number < 1);

    return $number if ($number <= 5);

    foreach my $prime_factor (qw(2 3 5)) {
        $number = $number / $prime_factor while ($number % $prime_factor == 0);
    }
    return $number == 1;
}

my $nth_number = 20;
die "Missing n-th smoon number" if (!$nth_number);

my ($i, @five_smooth_numbers) = (1, ());
while (scalar @five_smooth_numbers < $nth_number) {
    push @five_smooth_numbers, $i if (is_five_smooth_number($i));
    $i++;
}

say join("|", @five_smooth_numbers);
