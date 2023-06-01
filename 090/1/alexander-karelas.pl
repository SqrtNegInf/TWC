#!/usr/bin/env perl
use v5.36;

use v5.30;
use warnings;

#use Data::Dumper;

my $input = "GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG";

my %numbers;
foreach my $letter (qw/ G A T C /) {
    $numbers{$letter} = () = $input =~ /$letter/g;
}

#print Dumper(\%numbers);
say "$_: " . $numbers{$_} for sort keys %numbers;

my $output = $input;

$output =~ tr/GATC/CTAG/;

say $output;
