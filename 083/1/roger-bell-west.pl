#!/usr/bin/env perl
use v5.36;

use Test::More tests => 3;

is (wl('The Weekly Challenge'),6,'example 1');
is (wl('The purpose of our lives is to be happy'),23,'example 2');
is (wl('Markmið lífs okkar er að vera hamingjusöm'),19,'example 3');

sub wl {
  my $s=shift;
  $s =~ s/^\S+\s+(.*?)\s+\S+$/$1/;
  $s =~ s/\s+//g;
  return length($s);
}
