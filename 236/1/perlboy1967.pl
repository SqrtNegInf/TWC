#!/usr/bin/env perl
use v5.16;

use common::sense;

use Test::More;

sub exactChange (@) {
  my %r = (5 => 0, 10 => 0, 20 => 0);

  for (@_) {
    if ($_ == 5) {
      $r{5}++;
    } elsif ($_ == 10) {
      return 0 if ($r{5} < 1);
      $r{5}--; $r{10}++;
    } elsif ($_ == 20) {
      my $v = $_;
      if ($r{10} > 0) {
        $r{10}--; $v -= 10;
      }
      my $n = ($v - 5) / 5;
      return 0 if ($r{5} < $n);
      $r{5} -= $n; $r{20}++;
    } else {
      return 0;
    }
  } 

  return 1;
}

is(exactChange(5,5,5,10,20),1);
is(exactChange(5,5,10,10,20),0);
is(exactChange(5,5,5,20),1);
is(exactChange(5,5,20),0);
is(exactChange(5,10,5,10,20),0);

done_testing;
