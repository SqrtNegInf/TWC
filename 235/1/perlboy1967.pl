#!/usr/bin/env perl

use common::sense;

use Test::More;

use List::MoreUtils qw(slide);

sub removeOne (@) {
  scalar(grep { $_ < 0 } slide { $b - $a } @_) <= 1 ? 1 : 0;
}

is(removeOne(0, 2, 9, 4, 6), 1);
is(removeOne(5, 1, 3, 2), 0);
is(removeOne(2, 2, 3), 1);

done_testing;

