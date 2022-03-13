#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_vars /;

sub usage {
    print<<"-USAGE-";
Usage:
  $PROGRAM_NAME <N>

    <N>    length of hash-counting string
-USAGE-

    exit 0;
}

#if (scalar @ARGV != 1) { usage; }

my ($N) = 120;

my $wasHash = 0;
my @hashCounting;
my $pos = $N;

while ($pos > 0) {
    if ($wasHash) {
        unshift @hashCounting, "$wasHash";
        $pos -= length "$wasHash";
        $wasHash = 0;
    } else {
        unshift @hashCounting, '#';
        $wasHash = $pos;
        $pos--;
    }
}

say join q{}, @hashCounting;
