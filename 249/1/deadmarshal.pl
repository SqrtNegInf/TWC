#!/usr/bin/env perl
use v5.36;

use List::Util qw(all);

sub equal_pairs{
  my %h;
  $h{$_}++ foreach @{$_[0]};
  (all{$_%2} values %h) ? () : map{my $k=$_;map{[$k,$k]}1..$h{$k}/2}keys %h;
}

use Test::More;
#is_deeply([equal_pairs([3,2,3,2,2,2])], [[2, 2], [2, 2], [3, 3]], '[3, 2, 3, 2, 2, 2]');
is_deeply( [equal_pairs([1,2,3,4])], [], '');
done_testing;
