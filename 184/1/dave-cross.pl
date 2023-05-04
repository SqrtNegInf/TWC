#!/usr/bin/env perl
use v5.36;

my @foo = <ab1234 cd5678 ef1342>;

for (@foo) {
  die "Invalid input $_\n" if /[^a-z0-9]/;
}

my $prefix = '00';

my @out = map { s/^[a-z]+/$prefix++/e; $_ } @foo;

say "@out";
