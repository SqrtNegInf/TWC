#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
#use Data::Dumper;

my $n = 3;
die "vowel-strings: N ($n) should be 1..5\n" unless $n>=1 && $n<=5;

my @vow = qw(a e i o u);

#
# generate( $prefix, $moresteps );
#	Generate and print all vowel strings starting with $prefix,
#	and taking $moresteps more generative steps, applying
#	the above rules at each step to extend the prefix.
#
fun generate( $prefix, $moresteps )
{
	if( $moresteps==0 )
	{
		say $prefix;
		return;
	}

	# 'a' can only be followed by 'e' or 'i'.
	if( $prefix =~ /a$/ )
	{
		generate( $prefix.'e', $moresteps-1 );
		generate( $prefix.'i', $moresteps-1 );
	}

	# 'e' can only be followed by 'i'.
	elsif( $prefix =~ /e$/ )
	{
		generate( $prefix.'i', $moresteps-1 );
	}

	# 'i' can only be followed by 'a', 'e', 'o', or 'u'.
	elsif( $prefix =~ /i$/ )
	{
		foreach my $vowel (@vow)
		{
			next if $vowel eq 'i';
			generate( $prefix.$vowel, $moresteps-1 );
		}
	}

	# 'o' can only be followed by 'a' or 'u'.
	elsif( $prefix =~ /o$/ )
	{
		generate( $prefix.'a', $moresteps-1 );
		generate( $prefix.'u', $moresteps-1 );
	}

	# 'u' can only be followed by 'o' or 'e'.
	elsif( $prefix =~ /u$/ )
	{
		generate( $prefix.'o', $moresteps-1 );
		generate( $prefix.'e', $moresteps-1 );
	}
}


foreach my $firstvowel (@vow)
{
	generate( $firstvowel, $n-1 );
}
