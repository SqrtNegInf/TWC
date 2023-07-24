#!/usr/bin/env perl

=pod

The Weekly Challenge - 226
- https://theweeklychallenge.org/blog/perl-weekly-challenge-226

Author: Niels 'PerlBoy' van Dijke

Task 2: Zero Array
Submitted by: Mohammad S Anwar

You are given an array of non-negative integers, @ints.

Write a script to return the minimum number of operations to make every element equal zero.

|| In each operation, you are required to pick a positive number less than or equal
|| to the smallest element in the array, then subtract that from each positive element
|| in the array.

=cut

use v5.16;

use common::sense;

use Test::More;

sub zeroArray (@) {
  @_ = grep {$_ > 0} sort {$a <=> $b} @_;
  my $n = 0;
  while (@_) {
    my $i = shift;
    @_ = grep {$_ > 0} map {$_ -= $i} @_;
    $n++;
  }
  return $n;
}

is(zeroArray(1,5,0,3,5),3);
is(zeroArray(0),0);
is(zeroArray(2,1,4,0,3),4);

done_testing;
