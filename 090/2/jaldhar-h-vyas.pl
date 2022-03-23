#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_vars /;

sub usage {
    print<<"-USAGE-";
Usage:
  $PROGRAM_NAME <A> <B>
-USAGE-
    exit 0;
}

my $A = shift // 238;
my $B = shift // 13;

if ($A < 1 || $B < 1) {
    usage();
}

my $sum = ($A % 2) ? $B : 0;

while ($A > 1) {
    $A /= 2;
    $B *= 2;

    if ($A % 2) {
        $sum += $B;
    }
}

say $sum;
