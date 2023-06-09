#!/usr/bin/env perl
use v5.36;

my $d = 25525511135;
die "bad digit string $d, should be 4-12 digits\n" unless $d =~ /^\d{4,12}$/;
die "bad digit string $d, can't start with a 0\n" if $d =~ /^0/;

# first octet can be 1, 2 or 3 digits long
foreach my $firstlen (1..3)
{
	my $firstoctet = substr($d,0,$firstlen);
	next if $firstoctet > 255;
	#say "first: $firstoctet";

	# second octet can be 1, 2 or 3 digits long; not starting with 0
	foreach my $secondlen (1..3)
	{
		my $secondoctet = substr($d,$firstlen,$secondlen);
		next if $secondoctet == 0 || $secondoctet > 255;
		#say "second: $secondoctet";

		# third octet can be 1, 2 or 3 digits long; not starting with 0
		foreach my $thirdlen (1..3)
		{
			my $thirdoctet = substr($d,$firstlen+$secondlen,$thirdlen);
			next if $thirdoctet == 0 || $thirdoctet > 255;
			#say "third: $thirdoctet";

			# fourth octet: rest of string
			my $fourthoctet = substr($d,$firstlen+$secondlen+$thirdlen);
			next if $fourthoctet == 0 || $fourthoctet > 255;
			say "$firstoctet.$secondoctet.$thirdoctet.$fourthoctet";
		}
	}
}
