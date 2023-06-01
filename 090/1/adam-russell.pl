#!/usr/bin/env perl
use v5.36;

use constant SEQUENCE => "GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG";
my %nucleotide_map = (
    "T" => "A", 
    "A" => "T", 
    "G" => "C", 
    "C" => "G" 
);    

sub complementary_sequence{
    my($sequence) = @_;
    my @complement = map { $nucleotide_map{$_} } split(//, $sequence);
    return @complement; 
} 

MAIN:{
    print "length of sequence: " . length(SEQUENCE) . "\n";
    print "complementary sequence: " . join("", complementary_sequence(SEQUENCE)) . "\n";      
} 
