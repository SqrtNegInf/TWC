#!/usr/bin/env perl
use v5.36;
use English qw/ -no_match_vars /;

my ($N) = shift // 91011;

my $found = 1;

for my $len (1 .. (length $N) / 2) {
    $found = 1;

    my $n =  '0' x ((length $N) % $len) . $N;
    my @digits = $n =~ /.{1,$len}/g;
    for my $group (1 .. scalar @digits - 1) {
        if (substr($digits[$group], 0, 1) == '0' || $digits[$group] - $digits[$group - 1] != 1) {
            $found = undef;
            last;
        }
    }

    if ($found) {
        @digits = map { s/^0//; $_; } @digits;
        say join q{,}, @digits;
        exit;
    }
}

if (!$found) {
    say $N;
}
