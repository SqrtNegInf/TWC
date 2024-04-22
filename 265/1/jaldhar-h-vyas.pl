#!/usr/bin/env perl
use 5.030;
use warnings;

my @ints = (1,2,3,3,3,3,4,2);

my %count;
for my $i (@ints) {
    $count{$i}++;
}

say ((grep { $count{$_} / scalar @ints > 0.33 } sort { $a <=> $b} keys %count)[0] // 'undef');
