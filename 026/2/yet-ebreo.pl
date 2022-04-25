#!/usr/bin/env perl
# Create a script that prints mean angles of the given list of angles in degrees. 
# Please read wiki(https://en.wikipedia.org/wiki/Mean_of_circular_quantities) page 
# that explains the formula in details with an example.

use strict;
use warnings;
use v5.10;

use Math::Trig;

my ($y_comp,$x_comp) = 0;
$y_comp+=sin deg2rad($_),$x_comp+=cos deg2rad($_)  for (180,270,360);
say rad2deg(atan2($y_comp,$x_comp));
