#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Text::Unidecode;

for (@ARGV) {
  say unidecode $_;
}
