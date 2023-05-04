#!/usr/bin/env perl

use v5.36;

my @list = ( 'ab1234', 'cd5678', 'ef1342');

my $seq=0;
my @listout=();
foreach my $i (@list){
	$i=~/(\w\w)(\d{4})/;
	push (@listout, sprintf("%02d%d", $seq++, $2));
}

print "@listout\n";
