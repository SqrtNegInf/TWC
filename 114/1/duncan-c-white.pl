#!/usr/bin/env perl
use v5.36;

use Function::Parameters;

#
# my $ispal = ispalindromic( $n );
#	Return 1 iff $n is palindromic (in decimal of course)
#
fun ispalindromic( $n )
{
	my $rev = join( '', reverse split( //, $n ) );
	return $n==$rev ? 1 : 0;
}




#die "Usage: next-palindromic-number N\n" unless @ARGV==1;
my $n = shift // 1234;

do
{
	$n++;
}
while( ! ispalindromic($n) );

say $n;
