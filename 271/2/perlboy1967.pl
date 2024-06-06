#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

use Memoize qw(memoize);

memoize('d2b');

sub d2b ($int) { sprintf('%0b',$int) }

sub sortBy1bits (@ints) {
  sort{
    my ($a1,$b1) = (d2b($a),d2b($b));
    $a1 =~ tr/1/1/ <=> $b1 =~ tr/1/1/ || $a <=> $b
  } @ints;
}

is([sortBy1bits(0,1,2,3,4,5,6,7,8)],
               [0,1,2,4,8,3,5,6,7],'Example 1');
is([sortBy1bits(1024,512,256,128,64)],
               [64,128,256,512,1024],'Example 2');

done_testing;
