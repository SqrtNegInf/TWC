#!/usr/bin/env perl
use v5.36;

use List::Util 'all';

my @ARGV = <9 10 7 5 6 1>;
my @leaders = map  { $ARGV[$_] }
	      grep { is_leader($_, @ARGV) } 0 .. $#ARGV;

say '(', join(', ', @leaders), ')';

sub is_leader {
  my ($needle, @haystack) = @_;

  return 1 if $needle == $#haystack;

  return all { $haystack[$needle] > $_ } @haystack[$needle + 1 .. $#haystack];
}
