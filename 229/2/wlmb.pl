#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

my %count;

for( '4', '2 4', '1 2 4' ){
    $count{$_}++ for uniq split " ";
}
my @output=sort {$a <=> $b} grep {$count{$_}>=2} keys %count;
say map({"[$_]"} @ARGV), "->[@output]"
