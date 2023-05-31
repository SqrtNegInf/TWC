#!/usr/bin/env perl
use v5.36;

say join " ", (reverse grep /\w/, (split /\s+/, 'The Weekly Challenge'))
