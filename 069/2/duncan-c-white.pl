#!/usr/bin/env perl
use v5.36;

my $n = 7;


#
# my $ss = switch($s);
#	Return the string 1-s complement of the binary string $s.
#	eg. switch('001') is '110'.
#
sub switch( $s )
{
	$s =~ tr/01/10/;
	return $s;
}


my $s = "";
foreach my $x (1..$n)
{
	# SN = SN-1 + '0' + switch(reverse(SN-1))
	$s .= '0' . switch(reverse($s));
	#say "s($x) = $s";
}
say "s($n) = $s";
