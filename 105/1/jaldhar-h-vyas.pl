#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_Vars /;
use Math::Round;

sub usage {
print<<"-USAGE-";
Usage:
  $PROGRAM_NAME <N> <k>
  
    <N>    root
    <k>    number
-USAGE-
    exit 0;
}

#if (scalar @ARGV < 2) { usage; }

my ($N, $k) = (5,34);
say nearest(0.01, $k ** (1.0 / $N));
