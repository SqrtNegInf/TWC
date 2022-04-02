#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
#use Data::Dumper;

#
# my $result = fnrpass($s);
#	Given a substring $s, perform one FNR pass and return a single
#	character - the last-most non-repeating character in $sub, or '#' if
#	all chars in $s repeat.
#
fun fnrpass( $s )
{
	my @list = split( //, $s );

	# convert each char of $s to bag (frequency hash) - same code was in ch-1!
	my %freq;
	$freq{$_}++ foreach @list;

	foreach my $ch (reverse @list)
	{
		return $ch if $freq{$ch}==1;
	}
	return '#';
}


#
# my $fnr = fnr($string);
#	Find the First (Last) Non-repeating char string,
#	as described above.
#
fun fnr( $string )
{
	my $len = length($string);
	my $result = '';
	foreach my $i (1..$len)
	{
		my $sub = substr($string,0,$i);	# take first $i chars
		$result .= fnrpass($sub);
	}
	return $result;
}



my $string = 'ababcabd';

my $fnr = fnr($string);
say "fnr: ", $fnr;
