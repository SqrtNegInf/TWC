#!/usr/bin/env perl

use strict;
use warnings;

range('input.txt',3,6);

sub range {
  my $fn=shift;
  my $a=shift;
  my $b=shift;
  my $n=0;
  open I,'<',$fn;
  while (<I>) {
    $n++;
    if ($n > $b) {
      last;
    }
    if ($n>=$a) {
      print $_;
    }
  }
  close I;
}
