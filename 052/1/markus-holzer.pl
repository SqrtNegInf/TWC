#!/usr/bin/env perl
use v5.36;

sub stepping
{
	my @n = split '', shift;
	my $m = shift @n;

	for my $n ( @n ) { 
		return unless abs($m - $n) == 1;
		$m = $n;
	}
	1;
}

my ($from, $to) = (111,999);

print "$_\n" for grep { stepping($_) } $from .. $to;
