#!/usr/bin/env perl
use v5.36;

use Math::Calc::Parser 'calc';
use utf8;

print("Enter a math expression to calculate : ");
my $problem = '2+2';
chomp($problem);

my $result = calc $problem;
print("$problem = $result\n");
