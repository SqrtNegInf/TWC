#!/usr/bin/env perl

use v5.36;
my ($n, @perm, $nn, $x, $cute);

# loop over possible values of $n
for $nn (1 .. 15) {
	@perm = (0);
	$n = $nn;
	$cute = 0;
	@perm = find_cute(@perm);
	shift @perm;
	say qq[cute[$nn] = $cute];
}

sub find_cute {   # (@perm)

	# finds all the possible cute sublists comprising @perm and one additional digit
	# or returns if the list is complete
	
	my ($next_index, @perm, $j, $i, @used);
	
	# initialise
	@perm = @_;
	$next_index = scalar(@perm);
	
	# if we have enough digits, increement the cute count and return
	if ($next_index > $n) {
		$cute ++;
		return;
	}

	# set $used[$i] to 1 if $i has already been used in the string
	for $i (1 .. $n) {
		$used[$i] = 0;
	}
	for $i (1 .. $next_index) {
		if (defined($perm[$i])) {
			$used[$perm[$i]] = 1;
		}
	}

	# check whether adding each unused factor and multiple of the index will work as the next element
	for $j (1 .. $n) {
		if (not $used[$j] and ($next_index % $j == 0 or $j % $next_index == 0)) {
			find_cute(@perm, $j);				
		}
	}	
}
