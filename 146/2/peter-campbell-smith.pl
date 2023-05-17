#!/usr/bin/env perl
use v5.36;

my (@given, $given, $a, $b, $pa, $pb, $ga, $gb);

@given = ('3/5', '4/3', '13/20', '1/2', '456/777', '777/456', '144/781', '14/14');

# loop over given children
for $given (@given) {
	($a, $b) = split /\//, $given;
	 
	# find the parents and grandparents
	($pa, $pb) = parents($a, $b);
	($ga, $gb) = parents($pa, $pb);
	
	# show result
	speak("$a/$b", '     parent', $pa, $pb);
	speak("$a/$b", 'grandparent', $ga, $gb);
	say '';
}
 
sub parents {
 
	my ($a, $b, $pa, $pb);
 
	# as described above
	($a, $b) = @_;
	if ($a / $b < 1) {   # a left child
		$pa = $a;
		$pb = $b - $a;
	} else {             # a right child
		$pa = $a - $b;
		$pb = $b;
	}
	
	# not a member if pa or pb calculates as 0 or if a == b and a != 1
	return (-1, -1) if ($pa == 0 or $pb == 0 or ($pa == $pb and $pa != 1));
	return ($pa, $pb);
}

sub speak {
	
	my ($child, $relation, $a, $b) = @_;
	if ($a > 0) {
		say qq[The $relation of $child is $a/$b];
	} else {
		say qq[The $relation of $child does not exist];
	}
}
 
	
