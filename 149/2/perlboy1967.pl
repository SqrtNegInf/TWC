#!/usr/bin/env perl
use v5.36;

use bigint;
use List::MoreUtils qw(duplicates);
use POSIX qw(floor);

my @digits = (0 .. 9, 'A' .. 'Z');

foreach my $base (2 .. 12) {
  my $iSqrt = sqrt convertBaseNtoBase10(join('', reverse @digits[0 .. $base-1]), $base);

  while ($iSqrt >= 1) {
    my $nSqr = convertBase10toBaseN($iSqrt * $iSqrt, $base);

    if (!duplicates(split//, $nSqr)) {
      say "f($base) = $nSqr";
      last;
    }

    $iSqrt--;
  }
}

sub convertBase10toBaseN {
  my ($n, $base) = @_;

  state $digits = [@digits];

  my @nMod; my %nMod;

  while ($n) {
    push(@nMod, $n % $base);
    $nMod{$nMod[-1]}++;
    $n = floor($n/$base);  # Use floor instead of int(..) for performance
  }

  return join('', reverse map {$digits->[$_]} @nMod);
}

sub convertBaseNtoBase10 {
  my ($n, $base) = @_;

  my ($res, $i) = (0, 0);
  state $digits = { map { ($_, $i++) } (@digits) };

  $i = 0;
  foreach (reverse split //, $n) {
    $res += $digits->{uc$_} * ($base**$i++);
  }

  return $res;
}
