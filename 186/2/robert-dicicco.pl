#!/usr/bin/env perl
use v5.36;
use utf8;
use Text::Unidecode;

my @arr = ("ÃÊÍÒÙ", "âÊíÒÙ");

for my $string (@arr) {

  print unidecode($string) . "\n";

}
