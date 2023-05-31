#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
#use Function::Parameters;
#use Data::Dumper;
use List::Util qw(min);

my $debug=0;
#die "Usage: edit-distance [--debug] A B\n" unless
#	GetOptions( "debug" => \$debug ) && @ARGV==2;
my( $a, $b ) = ('kitten', 'sitting');

my $ed = lev($a, $b);
say $ed;

#
# my $ed = lev($a, $b);
#	Calculate and return the Levenshtein edit distance between $a and $b.
#	Naive recursive implmentation, basically:
#		len(a), if len(b)==0
#		len(b), if len(a)==0
#		lev(tail(a),tail(b), if a[0]==b[0]
#		else 1 + min(
#			lev(tail(a),b),
#			lev(a,tail(b)),
#			lev(tail(a),tail(b)) )
#
sub lev( $a, $b )
{
	return length($a) if length($b)==0;

	return length($b) if length($a)==0;

	# if a[0]==b[0]: lev(tail(a),tail(b)
	if( substr($a,0,1) eq substr($b,0,1) )
	{
		return lev( substr($a,1), substr($b,1) );
	}

	# 1 + min(
	#	lev(tail(a),b),
	#	lev(a,tail(b)),
	#	lev(tail(a),tail(b)) )
	return 1 + min(
		lev(substr($a,1), $b),
		lev($a,substr($b,1)),
		lev(substr($a,1), substr($b,1))
	);
}
