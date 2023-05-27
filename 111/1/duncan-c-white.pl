#!/usr/bin/env perl
use v5.36;

#use Function::Parameters;

my @m = (
	[ 1,  2,  3,  5,  7 ],
	[  9, 11, 15, 19, 20 ],
	[ 23, 24, 25, 29, 31 ],
	[ 32, 33, 39, 40, 42 ],
	[ 45, 47, 48, 49, 50 ],
);

#
# my $found = search( $n, @m );
#	Ok, search for $n in 2-D array @m.
#	Return 1 if found, 0 otherwise.
#
#fun search( $n, @m )
sub search( $n, @m )
{
	return 0 if $n < $m[0][0];
	return 0 if $n > $m[4][4];

	# find row
	my $rowno;
	for( $rowno = 0; $rowno<5; $rowno++ )
	{
		last if $m[$rowno][0] <= $n && $m[$rowno][4] >= $n;
	}

	# in row rowno, just grep
	my $found = grep { $_ == $n } @{$m[$rowno]};
	return $found ? 1 : 0;
}



#die "Usage: matrix-search N\n" unless @ARGV==1;
my $n = shift//39;

my $found = search( $n, @m );
say ($found ? $n : 0);
