#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my @a = (1, 2, 2, 3, 2, 4, 2);
my $target = @a / 2;
my $result = -1;
my %cnt;

for my $x (@a) {
    if (++$cnt{$x} > $target) {
        $result = $x;
        last;
    }
}

say $result;
