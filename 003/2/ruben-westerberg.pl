#!/usr/bin/env perl
use v5.36;

my $lines=10;
my $current=[1];
foreach  (1 .. $lines)  {
	printRow($current); #print the current row
	$current= makeRow($current) #make the next row;
}

sub printRow {
	my $in=shift;
	foreach (@$in) {
		#TODO: Add centralised format
		printf "%d ", $_;;
	}
	print "\n";
}
sub makeRow {
	my $in=shift;
	my @row=(@$in,0);
	my @outRow;
	my $previous=0;
	foreach (@row) {
		push @outRow, $_+ $previous;
		$previous=$_;
	}
	return \@outRow;
}
