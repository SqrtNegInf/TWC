#!/usr/bin/env perl
use v5.36;

my( $k, $n ) = (3,4);
die "kth-perm-n: n $n must be range 1..\n" unless $n>=1;

my $nperms = fact( $n );
die "kth-perm-n: k $k must be range 1..$nperms\n" unless $k>=1 && $k<=$nperms;

my $alldigits = join('', 1..$n);
my $permstr = nthperm( $k-1, $alldigits, $n, $nperms );
say "${k}th perm of $alldigits is $permstr";

#
# my $permstr = nthperm( $permno, $alldigits, $n, $nperms );
#	Return the $permno'th permutation (range 0..$nperms-1)
#	of $alldigits (length $n).
#
sub nthperm( $permno, $alldigits, $n, $nperms )
{
	if( $n==1 )
	{
		return substr( $alldigits, $permno, 1 );
	}
	my $w = $nperms / $n;

	my $firstdigit = substr( $alldigits, int($permno/$w), 1 );
	my $permstr = $firstdigit;
	$alldigits =~ s/$firstdigit//;
	$permstr .= nthperm( $permno%$w, $alldigits, $n-1, $nperms/$n );
	return $permstr;
}




#
# my $fact = fact( $n );
#	Calculate n!
#
sub fact( $n )
{
	my $result = 1;
	$result *= $_ for 1..$n;
	return $result;
}




