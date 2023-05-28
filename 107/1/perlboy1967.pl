#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

# Prototypes
sub incBaseNnumber :prototype($\@);
sub isSelfDescriptiveBaseNnumber :prototype($\@);

my ($found, $base) = (0, 1);

while ($found < 3) {
  my @d = (map { 0 } (1 .. $base - 1), 1);
  do {
    if (isSelfDescriptiveBaseNnumber($base,@d)) {
      printf "Match: %s\n", join('',@d);
      $found++;
    }
  } while (!incBaseNnumber($base,@d));
  $base++;
} 


# This subroutine will only work up to base 26
sub incBaseNnumber :prototype($\@) {
  my ($b,$arDigits) = @_;

  my ($overflow,$d,$dMax) = (0,0,scalar(@$arDigits));

  while (!$overflow) {
    $arDigits->[$d] = ($arDigits->[$d] + 1) % $b;
    last if $arDigits->[$d++];
    if ($d >= $dMax) {
      push(@$arDigits,1);
      $overflow++; 
    }
  }

  return $overflow; 
}


# This subroutine will only work up to base 10
sub isSelfDescriptiveBaseNnumber :prototype($\@) {
  my ($b,$arDigits) = @_;

  my @checkDigit;
  for my $d (0 .. $b - 1) {
    $checkDigit[$d] = scalar(grep { $_ == $d } @$arDigits) == $arDigits->[$d];
  }

  return min(@checkDigit) == 1;
}
