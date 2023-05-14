#!/usr/bin/env perl
use v5.36;

use ntheory qw/factorial/;

my $prevval = 0;

print 'Left Factorials: ';

foreach(0..9){
  my $val = factorial($_);

  $prevval += $val;

  print "$prevval ";
}

print "\n";
