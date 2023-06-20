#!/usr/bin/env perl
use v5.36;

use ntheory qw(divisors);

my $limit = shift || 1000;

# iterate over all numbers up to limit and sum their divisors
my %n; # hash of divisors sums, for example, $n{10} = 8 = 1+2+5
my $n = 1;
while ($n <= $limit) {
    my @d = divisors($n);
    pop(@d); #discard self, for example the divisors of 10 are 1,2,5,10, so discard 10

    map { $n{$n} += $_ } @d;
    $n++;
}

# search our hash for pairs, $p
foreach my $n (sort {$a <=> $b} (keys %n)) {
    my $p = $n{$n};
    if ( exists($n{$p}) ) {
    	say "($n, $n{$n})" if ($n{$p} == $n and $p != $n);
    	delete $n{$n}; # so we don't match twice
    }
}
