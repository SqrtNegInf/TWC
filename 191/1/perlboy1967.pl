#!/usr/bin/env perl

use v5.16;
use warnings;

use Test::More;
use List::Util qw(max);
use List::MoreUtils qw(all none firstidx);

sub twiceLargest {
  return -1 if @_ < 2;

  my $max = max(@_);

  return ((firstidx { $max < ($_ << 1) } grep { $_ != $max } @_) == -1 ? 1 : -1);
}

is(twiceLargest(1,2,3,4),-1);
is(twiceLargest(1,2,0,5),1);
is(twiceLargest(2,6,3,1),1);
is(twiceLargest(1),-1);
is(twiceLargest(1,2),1);
is(twiceLargest(),-1);

done_testing;
