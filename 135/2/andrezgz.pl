#!/usr/bin/env perl
use v5.36;

my $sedol = 'B0YBKL9';
say is_valid($sedol);
exit 0;

sub is_valid {
    my $sedol = shift;

    return 0 if !$sedol || $sedol !~ /^([0-9B-DF-HJ-NP-TV-Z]{6})([0-9])$/;
    my $code  = $1;
    my $check = $2;

    my $sum = 0;
    for (0 .. 5) {
        my $v = substr $code, $_, 1;     # value for numbers
        $v = ord($v) - 55 if $v !~ /\d/; # value for letters (alphabet position)
        $sum += $v * (1,3,1,7,3,9)[$_];  # weighted sum of values
    }

    return $check == (10 - $sum % 10) % 10 ? 1 : 0;
}
