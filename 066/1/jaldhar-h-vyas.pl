#!/usr/bin/env perl
use 5.030;
use warnings;
use English qw/ -no_match_vars /;

sub usage {
    print<<"--USAGE--";
Usage:
  $PROGRAM_NAME <M> <N>
  
    <M>    dividend
    <N>    divisor
--USAGE--
    exit(1);
}
my ($M, $N) = (11,3);

my $negative = ($M < 0) ^ ($N < 0);
my $dividend = abs($M);
my $divisor = abs($N);
my $quotient = 0;

while ($dividend >= $divisor) {
    $dividend -= $divisor;
    $quotient++;
}

if ($negative) {
    $quotient = -$quotient;
    if ($dividend > 0) {
        $quotient--;
    }
}

say $quotient;
