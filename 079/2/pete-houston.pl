#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

my @ARGV = (2,1,4,1,2,5);
print_histo (@ARGV);
histo_capacity (@ARGV);

sub histo_capacity {
	my @in = @_;
	my $start = shift @in;
	my $capacity = 0;
	while (my $next = shift @in) {
		last unless scalar @in;
		my $max = max (@in);
		$start = $max if $max < $start;
		if ($next < $start) {
			$capacity += $start - $next;
			next;
		}
		$start = $next;
	}
	print "\nCapacity is $capacity\n";
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
