#!/usr/bin/env perl
use v5.36;

use bigint;

my $prod=2;
my $prec=1;
print "$prod\n";
foreach my $i (1 .. 9){
	$prod=$prec*$prod;
	$prec=$prod;
	$prod++;
	print "$prod\n";
}
