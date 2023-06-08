#!/usr/bin/env perl
use v5.36;

my ($N) = 64;

my @test;

if (defined $N) {
  @test = ($N);
} else {
  @test = (9, 45, 128);
}

foreach my $t (@test) {
  printf "The power integers of %d is/are: %s\n",
    $t, join(', ', findPowers($t));
}

sub findPowers {
  my ($n) = @_;

  my @p;

  for my $p (2 .. int(sqrt($n))) {
    if (int(log($n)/log($p)) == log($n)/log($p)) {
      push(@p, sprintf('%d^%d', $p, int(log($n)/log($p))));
    }
  }

  push(@p, "$n^1");

  return @p;
}
   
   

