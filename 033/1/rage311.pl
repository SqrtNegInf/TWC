#!/usr/bin/env perl
use v5.36;

undef $/;

for my $file ('../00-blogs') {
  warn "$!" and next unless open my $fh, '<', $file;
  my %count;
  $count{$_}++ for grep { /[a-z]/ } map { lc } split //, <$fh>;
  say $file;
  say "$_: $count{$_}" for sort keys %count;
  print "\n";
}
