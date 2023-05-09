#!/usr/bin/env perl
use v5.36;
use List::Util 'sum';

my $wanted = shift // 8;
my $n = 1;
my @happy;
while (@happy < $wanted) {
   push @happy, $n if is_happy($n);
   ++$n;
}
say join ', ', @happy;

sub is_happy ($n) {
   state $is_happy = { 1 => 1 };
   state $is_not_happy = {};
   return 1 if $is_happy->{$n};
   return 0 if $is_not_happy->{$n};
   my %round;
   while (! $round{$n}) {
      $round{$n} = 1;
      $n = sum map { $_ * $_ } split m{}mxs, $n;
      if ($n == 1) {
         $is_happy->{$_} = 1 for keys %round;
         return 1;
      }
   }
   $is_not_happy->{$_} = 1 for keys %round;  # to avoid the void warning
   return 0;
}
