#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Sort::Key qw(nkeysort);
use List::MoreUtils qw(indexes);
use integer;

use Test2::V0 -srand => 1;

is(target_index([1, 5, 3, 2, 4, 2], 2), [1, 2], 'Example 1');
is(target_index([1, 2, 4, 3, 5], 6), [], 'Example 2');
is(target_index([5, 3, 2, 4, 2, 1], 4), [4], 'Example 3');
done_testing();

sub target_index
{
     my ($aref, $elm) = @_;
     return
          [indexes { $_ == $elm } nkeysort {$_} @$aref];
}
