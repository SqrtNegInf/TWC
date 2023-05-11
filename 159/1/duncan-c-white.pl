#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw(sum0);

#
# my( $redn, $redd ) = reduce_fraction( $num, $denom );
#	Reduce the fraction $num/$denom to it's reduced fractional
#	form, eg reduce_fraction(9,12) == (3,4).
#
sub reduce_fraction {
	my( $num, $denom ) = @_;
	foreach my $i (2..$denom)
	{
		while( $num % $i == 0 && $denom % $i == 0 )
		{
			$num /= $i;
			$denom /= $i;
		}
	}
	return( $num, $denom );
}



my $debug=0;
die "Usage: farey-sequence [--debug] [N] (default 3)\n"
	unless GetOptions( "debug"=>\$debug ) && @ARGV<2;

my $n = shift // 7;

my @seq = ("0/1");
my %seen;		# which "numer/denom" fractions have we already seen?

for( my $denom=$n; $denom>=1; $denom-- )
{
	foreach my $num (1..$denom)
	{
		my( $redn, $redd ) = reduce_fraction( $num, $denom );
		say "$num/$denom: reduces to $redn/$redd" if $debug;
		my $f = "$redn/$redd";
		push @seq, $f unless $seen{$f};
		$seen{$f}++;
	}
}

@seq = sort {
	my($an,$ad)=split(m|/|,$a);
	my($bn,$bd)=split(m|/|,$b);
	$an/$ad <=> $bn/$bd
	} @seq;

say join(', ', @seq );
