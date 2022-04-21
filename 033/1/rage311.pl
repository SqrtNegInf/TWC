#!/usr/bin/env perl

use 5.030;
use warnings;
use strict;

undef $/;

for my $file ('../00-blogs') {
  warn "$!" and next unless open my $fh, '<', $file;
  my %count;
  $count{$_}++ for grep { /[a-z]/ } map { lc } split //, <$fh>;
  say $file;
  say "$_: $count{$_}" for sort keys %count;
  print "\n";
}
