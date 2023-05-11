#!/usr/bin/env perl
use v5.36;
use Math::NumberBase qw/from_decimal/;

my $num = 7;

my $base = 0;
my $retval = 0;
my $newnum = 0;

say "Input: $num";

foreach $base (2..($num-2)){                    # try various number bases
  my $basenum = Math::NumberBase->new($base);

  $newnum = $basenum->from_decimal($num);       # get input number converted to new base]

  say "In base $base: $newnum";

  $retval = checkDigits( $newnum);              # ship it off to be checked

  last if ($retval == 1);
}

say "Output: $retval";

sub checkDigits {
  my $num = shift;

  my @arr = split(//, $num);  # split digits into an array
  my $digit = $arr[0];        # save first digit to match against

  foreach (1..$#arr) {        # check remaining digits
    if( $arr[$_] != $digit){  # found a digit that does not match
      return 0;               # return failure
    }
  }

  return 1;                   # return success
 }
