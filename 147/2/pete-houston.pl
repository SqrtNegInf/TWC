#!/usr/bin/env perl 

my $limit = 1_000_000;
my (%seen, @pns);

for my $i (1 .. $limit) {
	# Calculate this one
	my $pn = $i * ( 3 * $i - 1) / 2;
	# Loop over all previous ones
	for my $j (@pns) {
		my ($diff, $sum) = ($pn - $j, $pn + $j);
		if ($seen{$diff} && is_pentagon ($sum)) {
			print "$pn and $j are the first pair\n";
			exit;
		}
	}
	# Store this one
	push @pns, $pn;
	$seen{$pn} = 1;
}

# Just in case we don't find a valid pair
die "Bailing out after trying $limit pentagon numbers.\n";

sub is_pentagon {
	my $x = shift;
	# Quadratic: 3i^2 -i - 2x = 0
	# root = (-b +/- sqrt(b^2 - 4ac)) / 2a
	my $term = sqrt (1 + 24 * $x);
	# Cannot be negative
	my $root = (1 + $term) / 6;
	# So numerator must be an integer multiple of 6, I think.
	return $root == int $root;
}	
