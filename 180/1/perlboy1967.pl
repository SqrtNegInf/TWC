#!/usr/bin/env perl

use v5.16;
use warnings;

# Prototype(s)
sub firstUniqueChar($);

use List::MoreUtils qw(singleton);

use Test::More;
use Test::Deep qw(cmp_deeply);


cmp_deeply(firstUniqueChar('Perl Weekly Challenge'),[0,'P']);
cmp_deeply(firstUniqueChar('Long Live Perl'),[1,'o']);

done_testing();


sub firstUniqueChar($) {
  my $re = sprintf '(?i)(.*?)([%s])', join '',singleton split //,lc $_[0];
  my (@r) = $_[0] =~ m#$re#;

  return [length $r[0], $r[1]];
}

