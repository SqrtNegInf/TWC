#!/usr/bin/env perl

use v5.36;
my @data=sort {$a<=>$b} 0..11;
my ($min, $max)=($data[0], $data[-1]);
my $median=median(@data);
my $q1=median(@data[0..(@data-2)/2]);
my $q3=median(@data[(@data+1)/2..@data-1]);
say join " ", "The five-number summary of ", @ARGV, "is";
say "min=$min, Q1=$q1, median=$median, Q3=$q3, max=$max";

sub median(@d){
    @d%2?$d[(@d-1)/2]:($d[@d/2-1]+$d[@d/2])/2
}
