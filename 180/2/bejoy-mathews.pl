#!/usr/bin/env perl
use v5.36;

my @n = (9,0,6,2,3,8,5);
my $i = 4;
my @result;

foreach(@n){if($i <= $_) { push (@result, $_) }}

print join(',',@result),"\n";
