#!/usr/bin/env perl
use v5.36;

my $N = '12345';
my %data;

my @array = split(//, $N);
$data{$_}++ for @array;
print "Output: ";
foreach my $key ( sort { $a <=> $b } keys %data ) {
    print "$data{$key}$key";
}
print "\n";
