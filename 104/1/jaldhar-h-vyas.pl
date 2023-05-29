#!/usr/bin/env perl
use v5.36;

sub fusc {
    my ($n) = @_;

    if ($n < 2) {
        return $n;
    }

    if ($n % 2 == 0) {
        return fusc($n / 2);
    } else {
        return fusc(($n - 1) / 2) + fusc(($n + 1) / 2);
    }
}

for my $n (0 .. 49) {
    print fusc($n), ' ';
}
print "\n";
