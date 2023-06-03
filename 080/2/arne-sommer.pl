#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use bigrat;   # -> inf

use Perl6::Junction 'all';
use List::Util qw/sum max/;
use Getopt::Long;


my $verbose = 0;

GetOptions("verbose"  => \$verbose);

my @N = (1, 4, 3, 2);

die "Please specify at least one element" unless @N;
die "Integers only" unless all(@N) == qr/^\d+$/;

push(@N, inf); unshift(@N, inf);
my %M = map { $_ => $N[$_] } 0 .. (@N -1);
my @C = (); ##  x (length(@N));
my $N_end = @N -2;

for my $index (sort { $M{$a} <=> $M{$b} } keys %M) {
  $C[$index] = candy_count($index);
  say ": Index $index with value $M{$index} and candies $C[$index]" if $verbose;
}

say sum(@C);

sub candy_count ($index) {
  return 0 if $index == 0 || $index == @N -1;
  return max($C[$index-1], $C[$index+1]) +1 if $N[$index] > $N[$index-1] || $N[$index] > $N[$index+1];
  return 1;
}
