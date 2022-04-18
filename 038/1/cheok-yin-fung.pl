#!/usr/bin/env perl

use Time::Piece;
use strict;
use warnings;

my $str = '2230120';
die "Format Error: A 7-digit string is expected." if length $str != 7;

$str =~ s/^1/20/;
$str =~ s/^2/19/;
die "Error: first digit must be 1 or 2! " unless $str =~ /[12]/;

my $Y = substr($str, 0, 4);
my $Month = substr($str, 4, 2);
my $d = substr($str, 6, 2);

die "Problem in month ($Month)! " 
    if $Month > 12 || $Month < 1;
my $check = Time::Piece->strptime(substr($str,0,6)."01" , "%Y%m%d"); 
die "Problem in date (last two digits: $d)! " 
    if $d > $check->month_last_day || $d < 1;

my $t = Time::Piece->strptime($str, "%Y%m%d"); 


print $t->strftime("%Y-%m-%d"), "\n";
