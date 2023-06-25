#!/usr/bin/env perl
use v5.36;

use Test::More;

sub isMonotonicArray {
  return if (scalar @_ < 2);

  my @arr = @_;
  my $trend = 0;

  my $i = shift(@arr);
  do {
    my $j = shift(@arr);
    $trend = ($j == $i ? 0 : $i < $j ? 1 : -1) if ($trend == 0);
    return 0 if ($trend and ($j - $i)/$trend < 0);
    $i = $j;
  } while (@arr);

  return 1;
}

is(isMonotonicArray(1,2,2,3),1);
is(isMonotonicArray(1,3,2),0);
is(isMonotonicArray(6,5,5,4),1);
is(isMonotonicArray(1,1,2,2),1);
is(isMonotonicArray(1,1),1);

done_testing;
