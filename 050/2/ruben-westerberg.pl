#!/usr/bin/env perl
use v5.36;

my $size=$ARGV[0]//3;
my @list= sort {$a > $b} (19,11,9,7,20,3,17,16,2,14,1);
#@list=sort { $a > $b} (2,1,6,3);
print "Sorted Input list: ",
join(",", @list),"\n";
print "Noble Integers found: ", join ", ", @list[grep { @list-$_-1 == $list[$_] } 0..@list-1];
