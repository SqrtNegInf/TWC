#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my $filename = $ARGV[0]// 'example.txt';

open(my $fh, '<', $filename)
	or die "Can't open $filename: @!";

my @row_numbers;
while (my $row = <$fh>){
	push @row_numbers, (split /,/, $row )[0]; 
}

my $sum_of_row_numbers = sum(@row_numbers);
my $sum_of_row_range = sum(1 .. (@row_numbers + 1));

my $missing_row = $sum_of_row_range - $sum_of_row_numbers;

say "The missing row number is $missing_row";
