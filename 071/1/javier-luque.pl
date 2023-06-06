#!/usr/bin/env perl
use v5.36;
srand 1;

my $N = shift // 20;

# Store answers
my @values;
my @peaks;

# Populate @values
for my $i (0 .. $N - 1) {
	push @values, int rand(50);

	# Check left most peak
	push @peaks, $values[$i - 1]
		if ( $i == 1 &&
		     $values[$i - 1] >  $values[$i] );

	# Check middle peaks
	push @peaks, $values[$i - 1]
		if ( $i > 1 &&
		     $values[$i - 1] >  $values[$i] &&
		     $values[$i - 1] >  $values[$i - 2]);

	# Check last peaks
	push @peaks, $values[$i]
		if ( $i == $N - 1 &&
	       $values[$i] > $values[$i - 1]);
}

# Output values
say 'Array: ' . '[' . (join ', ', @values) . ']';
say 'Peak:  ' . '[' . (join ', ', @peaks) . ']';
