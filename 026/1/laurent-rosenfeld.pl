#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/say/;

my ($str1, $str2) = ('chancellor', 'chocolate');
my %letters = map {$_ => 1} grep /[A-Za-z]/, split "", $str1;
my $count = scalar grep { exists $letters{$_}} split "", $str2;
say "$str2 has $count letters from $str1";
