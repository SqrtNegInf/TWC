#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq sum0);

my %count;
my @A = ("aba", "aabb", "abcd", "bac", "aabc");
# convert to lower case, split, find unique elements, sort them and join them
# to obtain unique representation of characters of word. Count how many appear.
$count{join "", sort {$a cmp $b} uniq split "", lc($_)}++ for (@A);
my %pairs;
$pairs{$_}=$count{$_}*($count{$_}-1)/2 for grep {$count{$_}>=2} keys %count;
my $result=sum0 values %pairs;
say "@A -> $result";
