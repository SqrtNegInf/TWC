#!/usr/bin/env perl
use v5.36;

use List::Util 'max';
use List::MoreUtils 'uniq';

histarea (<2 1 4 5 3 7>);

sub histarea {
	my @in = @_;
	my $size = scalar @in;
	my $area = $size;
	my $axb  = "1 x $size";
	my @steps = sort { $a <=> $b } uniq @in;
	for my $height (@steps) {
		my $contig = 0;
		my $max = 0;
		for my $col (@in) {
			if ($col >= $height) {
				$contig++;
				$max = max $max, $contig;
			} else {
				$contig = 0;
			}
		}
		my $rect = $max * $height;
		if ($rect > $area) {
			$area = max $area, $rect;
			$axb  = "$max x $height";
		}
	}
	print "Largest rectangle is $axb with area $area\n";
	&print_histo;
}

sub print_histo {
	my @y = @_;
	my $yval = max (@y);
	while ($yval) {
		printf "\%6i\%s\n",
			$yval, join '', map { $_ >= $yval ? ' #' : '  ' } @y;
		$yval--;
	}
	print ' ' x 4, ' _' x (1 + @y), "\n       @y\n";
}
