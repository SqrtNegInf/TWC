#!/usr/bin/env perl
use v5.36;

use Integer::Partition;

my $n = shift // 2;
my $s = shift // 10;

my @combos;
my $len;

my $i = Integer::Partition->new($s);
while (my $p = $i->next) {
    for my $arr ($p) {
        $len = 0;

        for (@$arr) {
           $len += length $_;
        }

        push @combos, $p if $len == $n;
    }
}

# Fill zeroes to right of sum
print $s . "0" x ($n - length $s) . "\n" if $s < 10;
print map { join('', @{$_}) . "\n" } @combos;
