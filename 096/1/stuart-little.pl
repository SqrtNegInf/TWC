#!/usr/bin/env perl
use warnings;
use v5.12;

say join " ", (reverse grep /\w/, (split /\s+/, 'The Weekly Challenge'))
