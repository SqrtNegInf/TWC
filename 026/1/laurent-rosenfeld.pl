#!/usr/bin/env perl
use v5.36;

my ($str1, $str2) = ('chancellor', 'chocolate');
my %letters = map {$_ => 1} grep /[A-Za-z]/, split "", $str1;
my $count = scalar grep { exists $letters{$_}} split "", $str2;
say "$str2 has $count letters from $str1";
