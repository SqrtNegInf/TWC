#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

sub uncommonWords ($line1,$line2) {
  my %f; $f{lc $_}++ for (split /\s+/, "$line1 $line2");
  my @w = grep { $f{$_} == 1 } sort keys %f;
  return @w ? @w : '';
}

is([uncommonWords('Mango is sweet','Mango is sour')],['sour','sweet']);
is([uncommonWords('Mango Mango','Orange')],['orange']);
is([uncommonWords('Mango is Mango','Orange is Orange')],['']);

done_testing;
