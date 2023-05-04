#!/usr/bin/env perl
use v5.36;

my $String = 'raku Yearly Challenge';
my $i=0;

foreach my $letter (split(//, $String)) {
	my @matches = $String =~ /$letter/gi;
	if ( scalar(@matches) eq 1 )
	{
		print ("The first unique letter is: $letter at index: $i\n");
		last;
	}
	$i++;
}
