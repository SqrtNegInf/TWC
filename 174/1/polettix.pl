#!/usr/bin/env perl
use v5.36;
use List::Util 'sum';

$|++;
my $n = shift // 18;
my @disariums = disariums($n, \&is_disarium_espresso);
say join ', ', @disariums;

sub disariums ($n, $tester) {
   my @disariums;
   my $candidate = 0;
   while (@disariums < $n) {
      push @disariums, $candidate if $tester->($candidate);
      ++$candidate;
   }
   return @disariums;
}

sub is_disarium_precached ($n) {
   state $pow = [];
   while ((my $k = $pow->@*) < length($n)) {
      ++$k;
      push $pow->@*, [ 0, 1, map { $_ ** $k } 2 .. 9 ];
   }
   my $exp = 0;
   $n == sum map { $pow->[$exp++][$_] } split m{}mxs, $n;
}

sub is_disarium_llcached ($n) {
   state $pow  = [];
   state $kpow = 0;
   while ($kpow < length($n)) {
      ++$kpow;
      push $pow->@*, 0, 1, map { $_ ** $kpow } 2 .. 9;
   }
   my $exp = 0;
   $n == sum map { $pow->[$_ + 10 * $exp++] } split m{}mxs, $n;
}

sub is_disarium_espresso ($n) {
   my $exp = 0;
   $n == sum map { $_ ** ++$exp } split m{}mxs, $n;
}
