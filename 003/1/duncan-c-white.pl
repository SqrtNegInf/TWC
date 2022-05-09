#!/usr/bin/env perl

use strict;
use warnings;

#use Benchmark qw(:all) ;

#
# my @result = firstn_regnos_v1( $n );
#	Generate the first N regular numbers via basic GENERATE AND TEST:
#	generate every integer, then check "is it 2^i.3^j.5^k for any i,j,k"?
#	Returns a list of the first N regular numbers.
#
sub firstn_regnos_v1
{
	my( $n ) = @_;
	my @result = (1);
	for( my $x=2; @result<$n; $x++ )
	{
		my $y=$x;
		$y/=5 while $y%5==0;
		$y/=3 while $y%3==0;
		$y/=2 while $y%2==0;
		push @result, $x if $y==1;
	}
	return @result;
}


#
# my @result = firstn_regnos_v2( $n );
#	Generate the first N regular numbers via a todo set
#	of higher 2^i.3^j.5^k values that we haven't yet
#	checked, and sorting the todo list to pick the smallest
#	every time.  Returns a list of the first N regular numbers.
#
sub firstn_regnos_v2
{
	my( $n ) = @_;
	my @result = (1);
	my %todo = map { $_ => 1 } qw(2 3 5);
	for( my $i=1; $i<$n; $i++ )
	{
		my @todo = sort { $a <=> $b } keys %todo;
		my $next = shift @todo;
		push @result, $next;
		# update the todo set: next is done, so remove it
		delete $todo{$next};
		# update the todo set: add 2*next, 3*nect and 5*next
		$todo{2*$next}++;
		$todo{3*$next}++;
		$todo{5*$next}++;
	}
	return @result;
}


#
# my @result = firstn_regnos_v3( $n );
#	Generate the first N regular numbers via a todo set
#	of higher 2^i.3^j.5^k values that we haven't yet
#	checked.  It's the same as _v2 EXCEPT that we pick the
#	smallest element in a different and more efficient way -
#	by searching linearly through the todo set - instead of
#	forming a list and sorting it, every time.
#	Returns a list of the first N regular numbers.
#
sub firstn_regnos_v3
{
	my( $n ) = @_;
	my @result = (1);
	my %v = map { $_ => 1 } qw(2 3 5);
	for( my $i=1; $i<$n; $i++ )
	{
		my $min = each %v;
		while( my $v = each %v )
		{
			$min = $v if $min>$v;
		}
		my $next = $min;
		push @result, $next;
		delete $v{$next};
		$v{2*$next}++;
		$v{3*$next}++;
		$v{5*$next}++;
	}
	return @result;
}


#
# my @result = firstn_regnos_v4( $firstn );
#	Generate the first $firstn regular numbers via a more
#	constrained "todo set" that never has both than
#	one term i-j-X or i-X-k or X-j-k in.  This is faster
#	and uses less memory.
#	Returns a list of the first $firstn regular numbers.
#
sub firstn_regnos_v4
{
	my( $firstn ) = @_;
	my @result = ();
	my @next = ( [ 1,0,0,0 ] );		# list of N-i-j-k 4-tuples
	my %haveij;				# distinct "i-j" pairs in @next
	my %haveik;				# distinct "i-k" pairs
	my %havejk;				# distinct "j-k" pairs
	for( my $a=1; $a<=$firstn; $a++ )
	{
		my $tuple = shift @next;
		my( $n, $i, $j, $k ) = @$tuple;
		#print "debug: result n=$n, i=$i, j=$j, k=$k\n";
		push @result, $n;
		# remove i-j-k from have* now that n-i-j-k is done
		delete $haveij{"$i-$j"};
		delete $haveik{"$i-$k"};
		delete $havejk{"$j-$k"};
		# consider each of (i+1,j,k), (i,j+1,k) and (i,j,k+1)
		foreach my $newt ( [$n*2, $i+1, $j, $k],
				   [$n*3, $i, $j+1, $k],
				   [$n*5, $i, $j, $k+1] )
		{
			my( $newn, $x, $y, $z ) = @$newt;
			#print "debug: found possible next n=$newn, x=$x, y=$y, z=$z\n";

			# skip newn-x-y-z if we already known x-y-? or x-?-z or ?-x-z
			# as this is a higher power combination that we will discover later
			next if $haveij{"$x-$y"} || $haveik{"$x-$z"} || $havejk{"$y-$z"};

			# ok, so newn-x-y-z is genuinely new: add it, first to have*
			$haveij{"$x-$y"}++;
			$haveik{"$x-$z"}++;
			$havejk{"$y-$z"}++;
			#print "debug: found actual next n=$newn, x=$x, y=$y, z=$z\n";

			# second, insert $newn, $x, $y, $z into @next in sorted-by-N order
			# - find first pos s.t. next[pos]>newn
			my $pos;
			for( $pos=0; $pos < @next && $next[$pos]->[0] < $newn; $pos ++ )
			{
			}
			# - add new item in at pos $pos:
			splice( @next, $pos, 0, $newt );
		}
	}
	return @result;
}


# -------------------------------- Main program --------------------------------


my $benchmark = shift // 0;
my $firstn = shift // 50;

if( $benchmark )
{
	timethese( $benchmark, {
		'v1' => sub { firstn_regnos_v1( $firstn ) },
		'v2' => sub { firstn_regnos_v2( $firstn ) },
		'v3' => sub { firstn_regnos_v3( $firstn ) },
		'v4' => sub { firstn_regnos_v4( $firstn ) },
	});
} else
{
	print "calculating first $firstn regular numbers by v1 (generate and test):\n";
	my @result = firstn_regnos_v1( $firstn );
	my $s1 = join(',', @result);
	print "they are: $s1\n";

	print "calculating first $firstn regular numbers via v2 (todo+sort):\n";
	@result = firstn_regnos_v2( $firstn );
	my $s2 = join(',', @result);
	#print "they are: $s2\n";

	my $same = $s1 eq $s2 ? "same" : "different";
	print "v1 and v2: $same\n";

	print "calculating first $firstn regular numbers via v3 (todo+find-smallest):\n";
	@result = firstn_regnos_v3( $firstn );
	my $s3 = join(',', @result);

	$same = $s1 eq $s3 ? "same" : "different";
	print "v1 and v3: $same\n";

	print "calculating first $firstn regular numbers via v4 (clever):\n";
	@result = firstn_regnos_v4( $firstn );
	my $s4 = join(',', @result);
	#print "v4: result $s4\n";

	$same = $s1 eq $s4 ? "same" : "different";
	print "v1 and v4: $same\n";
}
