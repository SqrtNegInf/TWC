#!/usr/bin/env perl
use v5.36;

use Math::Trig;

my @angle = (180,270,360);

my $xsum=0;
my $ysum=0;

foreach my $angle (@angle)
{
	$xsum += sin( deg2rad( $angle ) );
	$ysum += cos( deg2rad( $angle ) );
}

my $n = @angle;
my $xav = $xsum / $n;
my $yav = $ysum / $n;

my $result = rad2deg( atan2( $xav, $yav ) );

say "circular mean of @angle is $result";

