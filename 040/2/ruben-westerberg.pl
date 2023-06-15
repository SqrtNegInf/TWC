#!/usr/bin/env perl
use v5.36;

my @a=(10,4,1,8,12,3);
my @i=(0,2,5);

$,=" ";
print sort {$a <=> $b} @a[@i];
