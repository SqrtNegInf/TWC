#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
use Data::Dumper;

my $string = 'aabbababba';

#
# my $ispal = ispalindrome($string);
#	Return 1 iff $string is a palindrome; 0 otherwise.
#
fun ispalindrome( $string )
{
	my $r = reverse($string);
	return $string eq $r ? 1 : 0;
}


#
# my @sol = p1( $string );
#	Find all single substrings of length>1 of $string that are palindromes.
#	Return the list of singleton palindromic substrings.
#
fun p1( $string )
{
	my @result;
	my $l = length($string);
	foreach my $startpos (0..$l-2)
	{
		foreach my $endpos ($startpos+1..$l-1)
		{
			my $substr = substr($string,$startpos,
				1+$endpos-$startpos);
			die unless length($substr)>1;
			push @result, [$substr] if ispalindrome($substr);
		}
	}
	return @result;
}



#
# my @sol = p2( $string );
#	Find all pairs of non-overlapping substrings of length>1 of
#	$string that are palindomes.  Return a list of pairs.
#
fun p2( $string )
{
	my @result;
	my $l = length($string);
	foreach my $sp1 (0..$l-4)
	{
	    foreach my $ep1 ($sp1+1..$l-3)
	    {
		my $substr1 = substr($string,$sp1, 1+$ep1-$sp1);
		die unless length($substr1)>1;
		next unless ispalindrome($substr1);
		foreach my $sp2 ($ep1+1..$l-2)
		{
		    foreach my $ep2 ($sp2+1..$l-1)
		    {
			my $substr2 = substr($string,$sp2, 1+$ep2-$sp2);
			die unless length($substr2)>1;
			next unless ispalindrome($substr2);
			push @result, [$substr1,$substr2];
		    }
		}
	    }
	}
	return @result;
}


my @p1 = p1( $string );
my @p2 = p2( $string );

# hmm.. have to remove from p1 any element that is one of any pair in @p2
foreach my $pair (@p2)
{
	my( $first, $second ) = @$pair;
	#say "debug: first=$first, second=$second";
	@p1 = grep { $_->[0] ne $first && $_->[0] ne $second } @p1;
}

my @sol = ( @p1, @p2 );

#die Dumper(\@sol);
say @sol>0 ? join("\n", map { join(',', @$_) } @sol) : "-1";
