#!/usr/bin/env perl

use v5.32;

use common::sense;

use Test2::V0 -srand => 1;

sub sameString (\@\@) {
  join('',@{$_[0]}) eq join('',@{$_[1]}) ? 1 : 0;
}

is(sameString(@{[qw(ab c)]},@{[qw(a bc)]}),1);
is(sameString(@{[qw(ab c)]},@{[qw(ac b)]}),0);
is(sameString(@{[qw(ab cd e)]},@{[qw(abcde)]}),1);

done_testing;
