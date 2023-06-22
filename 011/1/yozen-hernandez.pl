#!/usr/bin/env perl
use v5.36;

use Carp;

# Solve a linear equation (form of y = mx + b)
# where x = y. Needs slope and y-intercept of
# equation (m and b above)
sub find_x_eq_y {
	my ($slope, $y_intercept) = @_;

	# Solve for x = y
	# $x = $x*$slope + $y_intercept
	# -$y_intercept = $x*$slope - $x
	# $x($slope-1) = -$y_intercept;
	return (-$y_intercept)/($slope - 1);
}

# This is the same as 9/5, but here so that
# we use the information given in the challenge
my $slope = (212-32)/(100-0);

# y-intercept is 32 in °F = °C(9/5) + 32
say "Intersect of Fahrenheit and Celsius scale is: ", find_x_eq_y($slope, 32);
