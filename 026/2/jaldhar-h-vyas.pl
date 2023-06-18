#!/usr/bin/env perl
use v5.36;

use constant PI => (atan2 1, 1) * 4;

sub deg2rad {
    return $_[0] * (PI / 180);
}

sub rad2deg {
    return $_[0] / (PI / 180);
}

my $sines = 0;
my $cosines = 0;

my @ARGV = (180,270,360);

for my $angle (@ARGV) {
    $sines += sin deg2rad($angle);
    $cosines += cos deg2rad($angle);
}

$sines /= scalar @ARGV;
$cosines /= scalar @ARGV;

say rad2deg(atan2 $sines, $cosines);

