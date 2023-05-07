#!/usr/bin/env perl
use v5.36;

use Test::More tests => 10;

my $f = sub {return $_[0] + 1};
my $g = sub {return $_[0] * 2};
my $h = compose($f,$g);

foreach (1..10) {
  is($f->($g->($_)),
     $h->($_),
     "example $_");
}

sub compose($f1,$f2) {
  return sub {
    $f1->($f2->($_[0]));
  }
}
