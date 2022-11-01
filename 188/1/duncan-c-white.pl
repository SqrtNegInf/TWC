#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use Data::Dumper;


my $debug=0;

my( $k, @list ) = (2, 4, 5, 1, 6);
@list = split( /\s*,\s*/, join(',',@list) );
say "debug: k=$k, list=", join(',',@list) if $debug;

my $found = 0;

foreach my $i (0..$#list-1)
{
	foreach my $j ($i+1..$#list)
	{
		next unless ($list[$i] + $list[$j] ) % $k == 0;
		say "found pair $i, $j (elements $list[$i], $list[$j])" if $debug;
		$found++;
	}
}
say $found;
