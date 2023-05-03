#! /usr/bin/env perl
use v5.36;
use Unicode::Normalize;

say makeover('ÃÊÍÒÙ');
say makeover('âÊíÒÙ');

sub makeover ($str)
{
  my $nfkd = NFKD($str);
  $nfkd =~ s/\p{NonspacingMark}//g;
  return Unicode::Normalize::reorder(Unicode::Normalize::decompose($nfkd));
}
