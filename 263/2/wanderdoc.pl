#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Sort::Key qw(nkeysort);
use Test2::V0 -srand => 1;

is(merge_items([ [1,1], [2,1], [3,2] ], [ [2,2], [1,3] ]), 
     [ [1,4], [2,3], [3,2] ], 'Example 1');
is(merge_items([ [1,2], [2,3], [1,3], [3,2] ], [ [3,1], [1,3] ]), 
     [ [1,8], [2,3], [3,3] ], 'Example 2');
is(merge_items([ [1,1], [2,2], [3,3] ], [ [2,3], [2,4] ]), 
     [ [1,1], [2,9], [3,3] ], 'Example 3');     
     done_testing();

sub merge_items
{
     use integer;
     my @arefs = @_; 
     my %merge;
     for my $paar ( map { @$_ } @arefs )
     {
          $merge{ $paar->[0] } += $paar->[1];
     }
     return [ map { [$_, $merge{$_}] } nkeysort{$_} keys %merge ];
}
