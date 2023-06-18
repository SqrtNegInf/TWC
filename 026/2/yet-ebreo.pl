#!/usr/bin/env perl
use v5.36;

use Math::Trig;

my ($y_comp,$x_comp) = 0;
$y_comp+=sin deg2rad($_),$x_comp+=cos deg2rad($_)  for (180,270,360);
say rad2deg(atan2($y_comp,$x_comp));
