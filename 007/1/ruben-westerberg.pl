#!/usr/bin/env perl
use v5.36;

print join "\n" ,grep {  my $sum=0; $sum += $_ for (split "", $_); ($_> 0)&&(($_ % $sum) == 0)} (0..50);
