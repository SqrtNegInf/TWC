#!/usr/bin/env perl
use warnings;
use strict;
use experimental 'signatures';
use utf8;

use Text::Unidecode;

*um = *Text::Unidecode::unidecode;

use Test::More tests => 2;

is um('ÃÊÍÒÙ'), 'AEIOU', 'Example 1';
is um('âÊíÒÙ'), 'aEiOU', 'Example 2';
