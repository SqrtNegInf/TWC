#!/usr/bin/env perl
use v5.36;

sub uncommon_words{
  my %h;
  $h{lc $_}++ foreach split /\W+/, $_[0] . ' ' . $_[1];
  sort grep{$h{$_} == 1} keys %h;
}

say join ' ', uncommon_words('Mango is sweet','Mango is sour');
say uncommon_words('Mango Mango','Orange');
say uncommon_words('Mango is Mango','Orange is Orange');

