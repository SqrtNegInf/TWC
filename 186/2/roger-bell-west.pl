#!/usr/bin/env perl
use v5.36;
use utf8;
use Text::Unidecode;

use Test::More tests => 2;

is(unidecode("ÃÊÍÒÙ"), "AEIOU", 'example 1');

is(unidecode("âÊíÒÙ"), "aEiOU", 'example 2');
