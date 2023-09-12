#!/usr/bin/env perl
use v5.36;

my %count;
my @A = (1,1,2,2,2,3);

$count{$_}++ for @A;
my @sorted=sort {$count{$a} <=> $count{$b} || $b <=> $a} @A;
say "@A -> @sorted";
