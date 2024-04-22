#!/usr/bin/env perl

use v5.36;

sub appearance_33 {
  my( $threshold, $lowest, %counts ) = 0.33 * @_;

     ( ! defined $lowest || $_<=$lowest )
  && ( ++$counts{$_} > $threshold       )
  && ( $lowest = $_                     )
    for @_;

  $lowest
}


say appearance_33 ((1,2,3,3,3,3,4,2));
