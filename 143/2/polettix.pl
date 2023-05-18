#!/usr/bin/env perl
use v5.36;

sub is_stealthy ($n) {
   my %match;
   for my $k (1 .. sqrt($n)) {
      next if $n % $k;
      my $sum = $k + $n / $k;
      return 1 if $match{$sum - 1} || $match{$sum + 1};
      $match{$sum} = 1;
   }
   return 0;
}

my @inputs = @ARGV ? @ARGV : qw< 36 12 6 >;
say "$_ -> " . is_stealthy($_) for @inputs;
