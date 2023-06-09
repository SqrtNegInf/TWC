#!/usr/bin/env perl
use v5.36;

my $n = 28;
die "excel-column: N should be 1..16384\n" unless $n>0 && $n<=16384;

my $str = "";
while( $n > 26 )
{
	my $digit = 1 + ($n-1) % 26;
	$str .= chr(ord('@')+$digit);
	$n = int( ($n-1) / 26 );
}
$str .= chr(ord('@')+$n);
say scalar reverse $str;
