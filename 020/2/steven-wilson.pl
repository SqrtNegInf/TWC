#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my $first_amicable_pair_found = 0;
my $number                    = 1;

while ( !$first_amicable_pair_found ) {
    $number++;
    my $pair_number                 = get_sum_divisors($number);
    my $sum_of_divisors_pair_number = get_sum_divisors($pair_number);
    if (   defined $sum_of_divisors_pair_number
        && $number == $sum_of_divisors_pair_number
        && $number != $pair_number )
    {
        $first_amicable_pair_found = 1;
    }
}

sub get_sum_divisors {
    my $number = shift;
    my @divisors = grep { $number % $_ == 0 } 1 .. ( $number / 2 );
    return sum @divisors;
}

print "The smallest pair of Amicable Numbers are: ";
print "(" . $number . ", " . get_sum_divisors($number) . ")\n";
