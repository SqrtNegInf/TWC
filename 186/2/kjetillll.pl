#!/usr/bin/env perl
use v5.36;

use utf8;
use Text::Unidecode;    # ubuntu: sudo apt install libtext-unidecode-perl

my @input = @ARGV
          ? eval"(".join(',',map qq("$_"),@ARGV).")"
          : 'âÊíÒÙ';

no warnings 'utf8';     # suppress "Wide character in say at..."
print "$_ →  ", unidecode($_), "\n" for @input;
