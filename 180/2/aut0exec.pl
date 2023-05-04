#!/usr/bin/env perl
use v5.36;


my @List = split(/,/, '1,9,0,6,2,3,8,5,104');
my $Int = 5;
my @Filtered;

foreach (@List) { push(@Filtered, $_) unless $_ <= $Int; }

$"=',';
print ("Filtered list is: @Filtered \n");
