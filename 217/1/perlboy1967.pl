#!/usr/bin/env perl

use v5.16;

use common::sense;

use List::MoreUtils qw(arrayify);

use Test::More;

sub nthElement ($\@) {
  (sort{$a<=>$b}arrayify($_[1]))[$_[0]-1];
}

is(nthElement(3,@{[
                   [3,1,2],
                   [5,2,4],
                   [0,1,3],
                ]}),1);
is(nthElement(3,@{[
                   [2,1],
                   [4,5],
                 ]}),4);
is(nthElement(3,@{[
                   [1,0,3],
                   [0,0,0],
                   [1,2,1],
                 ]}),0);
is(nthElement(4,@{[
                   [3,1,2],
                   [5,2,4],
                   [0,1,3],
                 ]}),2);
is(nthElement(12,@{[
                    [[0,1,2],[3,4,5],[6,7,8]],
                    [[0,0,0],[0,0,0],[0,0,0]],
                    [[8,7,6],[5,4,3],[2,1,0]],
                 ]}),1);

done_testing;
