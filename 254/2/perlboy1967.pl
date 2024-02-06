#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);

#use common::sense;

use Test2::V0 -srand => 1;

sub reverseVowels ($str) {
  my @v = $str =~ m/(?i)[aeiou]/g;
  ucfirst lc $str =~ s/(?i)[aeiou]/pop @v/egr;
}


is(reverseVowels('Raku'),'Ruka');
is(reverseVowels('Perl'),'Perl');
is(reverseVowels('Julia'),'Jaliu');
is(reverseVowels('Uiua'),'Auiu');

done_testing;
