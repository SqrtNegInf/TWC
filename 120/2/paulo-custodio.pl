#!/usr/bin/env perl
use v5.36;

my $hhmm = shift || "03:10";
my($hh, $mm) = split(/:/, $hhmm, 2);
my($hh_angle, $mm_angle) = clock_angles($hh, $mm);
my $angle = abs($hh_angle - $mm_angle);
if ($angle > 180) { $angle = 360 - $angle; }

say $angle;

sub clock_angles {
    my($hh, $mm) = @_;
    my $mm_angle = $mm/60*360;
    my $hh_angle = ($hh % 12)/12*360 + $mm_angle/360*1/12*360;
    return ($hh_angle, $mm_angle);
}
