#!/usr/bin/env perl
use v5.36;

my @in = qw(the quick brown fox jumps over the lazy dog);

my @out;
foreach my $n (0..length($in[0])-1) {
  foreach my $w (@in) {
    if (length($w)<$n+1) {
      last;
    }
    push @out,substr($w,$n,1);
  }
}

print join('',@out),"\n";
