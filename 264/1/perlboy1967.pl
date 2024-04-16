#!/usr/bin/env perl
use v5.32;
use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 1;

use List::AllUtils qw(firstres);

sub greatestEnglishLetter($str) {
  my %c = map { $_ => 1 } split //,$str;
  (firstres { $_ if exists $c{lc $_} } 
            reverse sort grep /^[A-Z]$/, keys %c) // '';
}

is(greatestEnglishLetter('PeRlwEeKLy'),'L','Example 1');
is(greatestEnglishLetter('ChaLlenge'),'L','Example 2');
is(greatestEnglishLetter('The'),'','Example 3');

done_testing;
