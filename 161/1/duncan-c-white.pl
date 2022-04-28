#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use Data::Dumper;

#
# my $isabaced = is_abeced( $word );
#	Return 1 (true) iff $word is an Abecedarian-word, i.e. all
#	it's letters are in sorted order.
#
sub is_abeced ($)
{
	my( $word ) = @_;
	my $sig = join( '', sort split( //, $word ) );
	return $sig eq $word ? 1 : 0;
}

my $debug=0;

my $dictfile = 'words';
open( my $infh, '<', $dictfile ) ||
	die "Abecedarian-words: can't open $dictfile\n";
my @dict;
while( <$infh> )
{
	chomp;
	push @dict, lc($_);
}
close( $infh );

# sort dictionary in descending order of length
@dict = sort { length($b) <=> length($a) } @dict;

#die Dumper \@dict;

my @abeced = grep { is_abeced($_) } @dict;

say for @abeced;
