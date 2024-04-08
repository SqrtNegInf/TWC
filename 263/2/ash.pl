#!/usr/bin/env perl

use v5.20;

use Data::Dumper;

my $items1 = [[1, 1], [2, 1], [3, 2]];
my $items2 = [[2, 2], [1, 3]];

my %values;
$values{$_->[0]} += $_->[1] for @$items1, @$items2;

my @result = map {[$_ + 0, $values{$_}]} sort {$a <=> $b} keys %values;

say join ' ', @{$result[0]};
say join ' ', @{$result[1]};
say join ' ', @{$result[2]};
