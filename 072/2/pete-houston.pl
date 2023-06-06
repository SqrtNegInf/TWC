#!/usr/bin/env perl
use v5.36;

my $start = 3;
my $end   = 6;
print "start = $start, end = $end\n";
for my $file ('input.txt') {
	open my $in, '<', $file;
	<$in> for 2 .. $start;
	print '' . <$in> for ($start .. $end);
	close $in;
}
