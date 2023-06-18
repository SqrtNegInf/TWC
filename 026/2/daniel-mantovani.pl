#!/usr/bin/env perl
use v5.36;

# first we define constant pi as twice a 90 degrees angle:

use constant PI => 2 * atan2( 1, 0 );

# now we read angles list

my @angles = (180,270,360);

# we are going to just add sines and cosines of each angle.
# The wiki page actually asks to average them, but as we are going to calculate
# an angle at the end, there is no difference with calculating it with the sums

my ( $sins_sum, $coss_sum ) = ( 0, 0 );

$sins_sum += sin( $_ * PI / 180 ) for @angles;
$coss_sum += cos( $_ * PI / 180 ) for @angles;

# There is a case when no circular mean exists, and it is when
# all angles are uniformly distributed on the circle.
# In that case, both $sins_sum and $coss_sum are 0
# To avoid precision math errors, we will assume that when sum of
# square of sum of sines and square of sum of cosines is less than
# 1 / 1_000_000 means both are 0

say $sins_sum * $sins_sum + $coss_sum * $coss_sum < 1e-6
  ? 'No circular mean exists for given angles'
  : sprintf( "Circular mean is: %.2f", 180 / PI * atan2 $sins_sum, $coss_sum );

