#!/usr/bin/env perl
use v5.36;

my $num = $ARGV[0] || 55;
$num < 1 && die "Invalid input (0)";

my $init = 1;
while (1) {
    my $bin = sprintf "%b", $init++;
    ($bin % $num < 1) && (say $bin) && last
}
