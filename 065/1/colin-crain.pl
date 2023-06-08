#!/usr/bin/env perl
use v5.36;


my ($digit_count, $target) = @ARGV;
$digit_count //=  2;
$target      //= 10;


my $start = ($digit_count == 1 ? '0' : '1' ). ( '0' x ($digit_count - 1));
my $end   = '9' x $digit_count;

my @result_set = grep { sum_digits($_) == $target } ($start..$end);

if (@result_set) {
    say $_ for @result_set;
}
else {
    say "there are no numbers of length $digit_count whose digits sum to $target";
}

## ## ## ## ## SUBS:

sub sum_digits {
    my @digits = split //, $_[0];
    my $sum;
    $sum += $_ for @digits;
    return $sum;
}
