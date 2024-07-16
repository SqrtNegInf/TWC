#!/usr/bin/env perl

use v5.36;

#use feature qw(signatures);
#use common::sense;

use Test2::V0 -no_srand;

use List::AllUtils qw(singleton);

sub countCommon {
  my %f;
  $f{$_}++ for (singleton(@{$_[0]}),singleton(@{$_[1]}));
  grep { $_ == 2 } values %f;
}

is(countCommon([qw{Perl is my friend}],
               [qw{Perl and Raku are friend}]),2);
is(countCommon([qw{Perl and Python are very similar}],
               [qw{Python is top in guest languages}]),1);
is(countCommon([qw{Perl is imperative Lisp is functional}],
               [qw{Crystal is similar to Ruby}]),0);

done_testing;
