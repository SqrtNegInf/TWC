#!/usr/bin/env perl
use v5.36;

my $numberInput = 55;
unless ($numberInput =~ /^[0-9]+$/){
    die "ERROR: Not a positive number '$numberInput'\n";
}

my $smallestMultiple = 0;
my $count = 1;

while ($smallestMultiple == 0 ){
    $smallestMultiple = ( $numberInput * $count ) =~ /^[01]+$/ ? ( $numberInput * $count) : 0;
    $count++;
}
print "$smallestMultiple\n"
