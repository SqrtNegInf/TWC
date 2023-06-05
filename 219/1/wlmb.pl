#!/usr/bin/env perl
use v5.36;

my @A = (-2,-1,0,3,4);
say "@A ->", join " ", sort {$a<=>$b} map {$_**2} @A;
