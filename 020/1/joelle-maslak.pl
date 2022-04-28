#!/usr/bin/env perl

use strict;
use warnings;

use v5.22;

my (@parts) = grep { state $i=1; $i++ % 2 } 'bookkeeper' =~ /((.)\2*)/gms;
say join("\n", @parts);

