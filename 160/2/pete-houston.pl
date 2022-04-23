#!/usr/bin/env perl

use strict;
use warnings;

my @n = (1, 3, 5, 7, 9);

my $presum = my $postsum = 0;
$postsum += $_ for @n;

for my $i (0 .. $#n) {
	$presum  += $n[$i - 1] if $i;
	$postsum -= $n[$i];
	if ($presum == $postsum) {
		print "$i\n";
		exit;
	}
}

print "-1\n";
