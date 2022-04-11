#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
#use Data::Dumper;

my @ARGV = (19,11,9,7,20,3,17,16,2,14,1);
foreach my $i (@ARGV)
{
	die "noble: element $i out of range 1..50\n" unless
		$i >= 1 && $i <= 50;
}

# remove duplicate items by turning list into set..
my %set = map { $_ => 1 } @ARGV;

# and finding the (distinct) keys of that set..
my @l = keys %set;

my @noble = find_all_noble( @l );
say "noble: $_" for @noble;


#
# my @noble = find_all_noble( @l );
#	Find and return a list of all noble elements in @l,
#	or the empty list if none are noble.  The definition
#	of noble is from above:
#	"A Noble Integer is an integer N in @L,
#	such that there are exactly N integers greater than N in @L"
#
fun find_all_noble( @l )
{
	my @noble;
	foreach my $element (@l)
	{
		my $ngt = grep { $_ > $element } @l;
		push @noble, $element if $element == $ngt;
	}
	return @noble;
}
