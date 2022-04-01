#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Function::Parameters;
#use Data::Dumper;
use List::Util qw(max);

#die "Usage: word-search wordgrid-filename dict-filename\n" unless @ARGV==2;
my( $gridfilename, $dictfilename ) = ('grid1', 'words.txt');

#
# my @g = readgrid($gridfilename);
#	Read the wordgrid filename, return @g, the grid
#	(an array of array-refs).
#
fun readgrid( $gridfilename )
{
	open( my $infh, '<', $gridfilename ) || die;
	my @result;
	while( <$infh> )
	{
		chomp;
		tr/ \t//d;
		my @ch = split(//);
		push @result, \@ch;
	}
	close($infh);
	return @result;
}

#
# my %words = readdict($dictfilename);
#	Read the dictionary filename, one word per line,
#	return a hash of upper-cased plain ASCII words.
#
fun readdict( $dictfilename )
{
	open( my $infh, '<', $dictfilename ) || die;
	my %result;
	while( <$infh> )
	{
		chomp;
		$_ = uc($_);
		$result{$_}++ if /^[A-Z][A-Z]+$/;
	}
	close($infh);
	return %result;
}


my @dir =
(
	[-1,0],	# up (delta r,c)
	[-1,1], # ne
	[0,1],  # e
	[1,1],  # se
	[1,0],  # down
	[1,-1], # sw
	[0,-1], # w
	[-1,-1],# nw
);


#
# my %foundword = findwordsonedir($grid,$isdictword,$r,$c,$deltar,$deltac);
#	Find all dictionary words (for which $isdictword->{word} is true)
#	contained in the grid starting at ($r,$c), looking in the
#	direction represented by ($deltar,$deltac)
#	as far as you like (without falling off the grid).
#	Return the set of words found, or () if no dictionary word is found.
#
fun findwordsonedir($grid,$isdictword,$r,$c,$deltar,$deltac)
{
	my %result;
	my $rows = @$grid;
	my $cols = @{$grid->[0]};
	my $word = $grid->[$r][$c];
	for( my $len = 1; ; $len++ )
	{
		$r += $deltar;
		$c += $deltac;
		last unless $r>=0 && $r<$rows && $c>=0 && $c<$cols;
		$word .= $grid->[$r][$c];
		next unless $isdictword->{$word};
		#say "found dict word $word";
		$result{$word}++;
	} 
	my @found = sort keys(%result);
	if( @found==0 )
	{
		#say "no dict words starting from ($r,$c) in direction ($deltar,$deltac)";
	}
	else
	{
		#say "dict words starting from ($r,$c) in direction ($deltar,$deltac): ",
		#	join(',',@found);
	}
	return %result;
}


#
# my @found = findwords( $grid, $isword );
#	Find all words (for which $isword->{word} is true)
#	contained in the grid, looking in all 8 orthogonal
#	(up/down, left/right) and diagonal directions.
#	Return the list of all such distinct words found.
#
fun findwords( $grid, $isword )
{
	my $rows = @$grid;
	my $cols = @{$grid->[0]};
	say "rows=$rows, cols=$cols";
	#say "isword(BIDE) = ", $isword->{BIDE}//"null";

	my %result;
	foreach my $r (0..$rows-1)
	{
		foreach my $c (0..$cols-1)
		{
			foreach my $dir (@dir)
			{
				my( $dr, $dc ) = @$dir;
				#say "starting at grid pos ($r,$c), dir ($dr,$dc)";
				my %foundword = findwordsonedir($grid,$isword,$r,$c,$dr,$dc);
				my @found = keys %foundword;
				next unless @found;
				@result{@found}=(1) x scalar(@found);
			}
		}
	}
	return sort(keys %result);
}


my @g = readgrid($gridfilename);
#say Dumper \@g;

my %isword = readdict($dictfilename);
#say Dumper \%isword;
##say "isword(BIDE) = ", $isword{BIDE}//"null";

my @found = findwords( \@g, \%isword );
my $n = @found;
say "found $n words in grid: ", join(',',@found);
