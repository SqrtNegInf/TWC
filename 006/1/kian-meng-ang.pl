#!/usr/bin/env perl
use v5.36;

use 5.010;
use strict;
use warnings;
use utf8;

my ($series) = '1,2,3,4,9,10,14,15,16';
my @numbers =  split /,/, $series;

my (@sequence, @group);
for my $i (1 .. $#numbers) {
    if ($numbers[$i] - $numbers[$i-1] == 1) {
        push @group, $numbers[$i-1] if (scalar @group == 0);
        push @group, $numbers[$i];
    }
    else {
        push @sequence, [@group];
        @group = ();
    }

    if ($i == $#numbers) {
        push @sequence, [@group];
        @group = ();
    }
}

my @shorter_series;
foreach my $s (@sequence) {
    if (scalar @{$s} >= 3) {
        push @shorter_series, sprintf '%d-%d', shift @{$s}, pop @{$s};
    }
    else {
        push @shorter_series, @{$s};
    }
}

say join q|,|, @shorter_series;
