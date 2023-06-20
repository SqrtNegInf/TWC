#!/usr/bin/env perl
use v5.36;

use List::Util qw(pairmap);

foreach my $in ('bookkeeper') {
  print join(' ',splitchange($in)),"\n";
}

sub splitchange {
  return pairmap {$a.$b} shift =~ /(.)(\g1*)/g;
}
