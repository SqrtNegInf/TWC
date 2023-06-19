#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

my $x;

@_=grep{@_[ map $x*$_,$_..@_/($x=$_) ] =0 if $_[$_] > 1}@_=0..54;
map { ($_[$_]-$_[$'] == 6) && print "$_[$'] $_[$_]\n" for  $_+//..$#_ } 0..$#_;
