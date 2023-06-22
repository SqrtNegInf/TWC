#!/usr/bin/env perl
use v5.36;

my $size = 5;

my @aIdentityMatrix = ();

for my $a (0..$size-1){
	my @aRow = ();
	for my $b (0..$size-1){
		if ($a == $b){
			push (@aRow, 1);
		}	else {
			push (@aRow, 0);
		}
	}
	push ( @aIdentityMatrix , \@aRow);
}


foreach my $row (@aIdentityMatrix){
	foreach my $column ( @{$row} ) {
		print $column ."\t";
	}
	print "\n";
}
