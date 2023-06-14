#!/usr/bin/env perl
use v5.36;

sub leonardo {
  my $i = shift;
  return 1 if $i <= 1;
  return leonardo($i-2)+leonardo($i-1)+1;
}

foreach my $i (0..20){
  print leonardo($i)."\n";
}
