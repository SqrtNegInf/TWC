#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

sub splitStrings ($sep,@str) {
  $sep = quotemeta $sep;
  grep /\S/, map { split $sep } @str;
}

is([splitStrings('.','one.two.three','four.five','six')],
   ['one','two','three','four','five','six']);
is([splitStrings('$','$perl$$','$$raku$')],
   ['perl','raku']);

done_testing;
