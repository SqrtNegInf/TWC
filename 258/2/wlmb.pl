#!/usr/bin/env perl

use v5.36;
use List::Util qw(sum0);

my $k = 1;
my @int=  (2, 5, 9, 11, 3);

# Convert to binary, add ones and compare to $k to filter indices
my @indices=grep {$k==sum0 split "", sprintf "%b",$_}0..@int-1;
my $result=sum0 @int[@indices];
say "k=$k, ints=@int -> ", $result;
