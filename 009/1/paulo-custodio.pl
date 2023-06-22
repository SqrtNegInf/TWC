#!/usr/bin/env perl
use v5.36;

sub num_diff_digits {
    my($n) = @_;
    my %digits;
    while ($n > 0) {
        my $digit = $n % 10;
        $digits{$digit}++;
        $n = int($n/10);
    }
    return scalar(keys %digits);
}

my $diff_digits = shift || 5;
my $n = 1;
$n++ while (num_diff_digits($n*$n) < $diff_digits);
say $n*$n;
