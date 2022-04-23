#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use List::Util qw(sum0);
#use Data::Dumper;

my $n = shift // 9;
die "four-is-magic: n ($n) must be < 10\n" if $n>9;
die "four-is-magic: n ($n) must be >= 0\n" if $n<0;

my @n_to_word = qw(zero one two three four five six seven eight nine);

my $word = $n_to_word[$n];

my @answer = ();

while( $word ne "four" )
{
	my $len = length($word);
	my $lenword = $n_to_word[$len];
	push @answer, "$word is $lenword";
	$word = $lenword;
}

push @answer, "four is magic";

say join( ', ', @answer );
