#!/usr/bin/env perl
use v5.36;

my($word1,$word2) = ('chancellor', 'chocolate');

# form a set of the letters in $word1 (case sensitive)
my %set = map { $_ => 1 } split(//, $word1);

# form a bag of the letters in $word2
my %bag;
map { $bag{$_}++ } split( //, $word2 );

# now, count up sum of bag elements for everything in set
my $t = 0;
foreach my $letter (keys %set)
{
	$t += $bag{$letter} if defined $bag{$letter};
}
say $t;
