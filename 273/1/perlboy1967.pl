#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

sub percentageOfString ($str,$char) {
  my %f; $f{$_}++ for (split(//,$str));
  int(0.5 + 100 * ($f{$char} // 0) / length($str));
}

is(percentageOfString('perl','e'),25,'Example 1');
is(percentageOfString('java','a'),50,'Example 2');
is(percentageOfString('python','m'),0,'Example 3');
is(percentageOfString('ada','67'),0,'Example 4');

done_testing;
