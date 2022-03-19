#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $N = $ARGV[0] // "Specify a string";

say '"', join(" ", reverse(split(/\s+/, $N))), '"';
