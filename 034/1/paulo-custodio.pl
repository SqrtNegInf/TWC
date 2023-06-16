#!/usr/bin/env perl
use v5.36;

my %data = (oranges => 3, pears => 2, apples => 4);
my @values = @data{qw(oranges apples)};
say join(", ", @values);
