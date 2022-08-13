#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Getopt::Long;
use Data::Dumper;
use Function::Parameters;

my $debug=0;
die "Usage: reversible-numbers-below-N [--debug] [N default 100]\n"
	unless GetOptions( "debug"=>\$debug ) && @ARGV<2;

#
# my $isrev = is_reversible($x);
#	Return true iff $x is reversible, in the above sense,
#	otherwise return false.
#
fun is_reversible( $x )
{
	my $r = reverse($x);
	my $sum = $x + $r;
	my @odd = grep { /[02468]/ } split(//, $sum);
	return @odd==0 ? 1 : 0;
}



my $limit = (shift // 100) - 1;

my @rev;
foreach my $x (1..$limit)
{
	push @rev, $x if is_reversible($x);
}
say join( ', ', @rev );
