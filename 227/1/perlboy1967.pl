#!/usr/bin/env perl
use v5.16;

use common::sense;

use Test::More;

use DateTime;

sub nFriday13th ($) {
  scalar grep { DateTime->new(year => $_[0], month => $_, day => 13)->day_of_week == 5 } (1 .. 12);
}

is(nFriday13th(2023),2);

done_testing;
