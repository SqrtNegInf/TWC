#!/usr/bin/env perl
use v5.36;

use List::Util qw<any>;

my $n = my $number = 11111;

my @primes = (2);
my @factors;
while ($n != 1) {
    my $lastp = $primes[-1];
    if ($n % $lastp == 0) {
        push @factors, $lastp;
        $n /= $lastp;
    } else {
        $lastp++ while any { $lastp % $_ == 0 } @primes;
        push @primes, $lastp;
    }
}

print "$number = ", join("*", @factors), "\n";

# Quick test
$n *= $_ foreach (@factors);
$n == $number or die "Oops, something went wrong!";
