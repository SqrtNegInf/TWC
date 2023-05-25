#!/usr/bin/env perl
use v5.36;
use Test::More tests => 1;

is(mr('example.txt'),12,'example 1');

sub mr {
  my $n=shift;
  my %f;
  open my $fh,'<',$n;
  while (<$fh>) {
    chomp;
    if (/^([0-9]+)/) {
      $f{$1+0}=1;
    }
  }
  my $a=1;
  while (1) {
    unless (exists $f{$a}) {
      return $a;
    }
    $a++;
  }
}
