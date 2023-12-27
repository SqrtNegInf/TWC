#!/usr/bin/env perl

use v5.32;

use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 1;

use List::MoreUtils qw(indexes);
use List::Util qw(min);

sub shortestDistance($str,$ch) {
 my @ch = split //, $str;
 my @idx = indexes { $_ eq $ch } @ch;

 map { 
   my $i = $_; $ch[$_] eq $ch ? 0 : min(map { abs($i - $_) } @idx);
 } 0 .. $#ch;
}

is([shortestDistance('loveleetcode','e')],[3,2,1,0,1,0,0,1,2,2,1,0]);
is([shortestDistance('aaab','b')],[3,2,1,0]);

done_testing;
