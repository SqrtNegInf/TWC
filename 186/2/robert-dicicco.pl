#!/usr/bin/env perl
use strict;
use warnings;
use Text::Unidecode;
use utf8;

my @arr = ("ÃÊÍÒÙ", "âÊíÒÙ");

for my $string (@arr) {

  print unidecode($string) . "\n";

}
