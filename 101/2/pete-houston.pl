#!/usr/bin/env perl
use v5.36;

use List::Util 'pairs';

my @vertices = map { /([0-9.-]+)/ and $1 } (1,1,-1,1,0,-3);
die "Usage: $0 x1 y1 x2 y2 x3 y3\n" unless 6 == @vertices;

my $result   = inside_paths (@vertices);

print "$result\n";

sub inside_paths {

	# Determine if the origin is on the same side of each line segment
	# as the 3rd point. If so, it is inside. If it is on any of the line
	# segments that's a positive result right away.
	# Return 1 for inside or on the line, 0 otherwise

	my @p = pairs @_;
	my $sameside = 0;

	for my $i (0 .. 2) {
		my @q = map { $p[$_] } grep { $_ != $i } (0 .. 2);
		my $dx = $q[1]->[0] - $q[0]->[0];
		my $dy = $q[1]->[1] - $q[0]->[1];
		my $originside = (0 - $q[0]->[1]) * $dx -
			(0 - $q[0]->[0]) * $dy;
		return 1 if $originside == 0; # On the line
		my $cornerside = ($p[$i]->[1] - $q[0]->[1]) * $dx -
			($p[$i]->[0] - $q[0]->[0]) * $dy;
		$sameside++ unless ($originside > 0 xor $cornerside > 0);
	}
	return $sameside == 3 ? 1 : 0;
}
