#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[0] || 4;
die "ERROR: Invalid number [$N].\n" unless ($N =~ /^\d+$/);
print count_set_bits($N), "\n";

sub count_set_bits {
    my $c = 0;
    $c   += (sprintf "%b", $_) =~ tr/1/1/ for 1..shift;
    return $c % 1000000007;
}
