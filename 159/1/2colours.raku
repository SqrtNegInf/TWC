#!/usr/bin/env raku

sub farey(Int() $n) {
  my @rest = (([\,] (1..$n)) ZX/ (1..$n)).flat.unique.sort.map(*.nude.join: '/');
  ('0/1', |@rest)
}

my $n = 8; # prompt 'Input: $n = ';
say "Output: {farey($n).join(', ')}.";
