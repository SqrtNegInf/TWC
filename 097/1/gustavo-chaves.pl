#!/usr/bin/env perl
use v5.36;

my ($N, $S) = @ARGV;

($N, $S) = (3, "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG");

my $alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
my $caesar = substr($alphabet, -$N) . substr($alphabet, 0, length($alphabet) - $N);

$alphabet .= lc $alphabet;
$caesar .= lc $caesar;

for ($S) {
    say eval "tr/$alphabet/$caesar/r";
}
