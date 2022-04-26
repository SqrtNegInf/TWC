#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Std;

my @seq=(5, 9, 2, 8, 1, 6);

foreach (1..1) {
  my @o=map {$seq[$_+1]-$seq[$_]} (0..$#seq-1);
  @seq=@o;
}

print join(' ',@seq),"\n";
