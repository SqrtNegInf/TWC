#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	[[[12, 11, 41],
      [15,  5, 35]],
     [36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47]
    ],
	[[[12,  3, 41],
      [15,  9, 35],
      [30,  5, 25]],
     [0, 1, 2, 3, 25, 26, 27, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
         51, 55, 56, 57, 58, 59]
    ],
];

sub bus_route
{
	my $routes = shift;
	
	my %tt;
	for my $r (@$routes) {
		my ($cycle, $start, $duration) = @$r;
		while (1) {
            if (!exists($tt{$start}) or ($duration + $start) < $tt{$start}) {
                $tt{$start} = ($start + $duration);
            }
			last if $start > 60;
			$start += $cycle;
		}
	}

	my @mins;
	my @deptmins = sort {$a <=> $b} keys %tt;
	for my $i (0..59) {
        shift @deptmins if $i > $deptmins[0];
        push @mins, $i if $tt{$deptmins[1]} < $tt{$deptmins[0]};
    }
	return \@mins;
}

for (@$cases) {
    is(bus_route($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

