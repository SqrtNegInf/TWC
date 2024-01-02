#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;

#use Data::Show;

sub di_string_match{
  my ($i,$j) = (0,length $_[0]);
  (map{$_ eq 'I' ? $i++ : $j--}split '',$_[0]),$i;
}

say di_string_match('IDID'); 
say di_string_match('III');
say di_string_match('DDI');

