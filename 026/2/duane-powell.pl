#!/usr/bin/env perl
use v5.36;

use Math::Trig;

my @angles = (180,270,360);
my $count = scalar(@angles);
my $x;
my $y;
foreach (@angles) {
	$x += cos($_ * pi/180);
	$y += sin($_ * pi/180);
}

my $angle_mean = atan2( $y/$count, $x/$count) * 180/pi;
print "The mean of angles ", join(',',@angles), " is $angle_mean\n";
