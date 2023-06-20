#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;

my @chunks;
push @chunks, $& while 'bookkeeper' =~ /(.)\1*/g;
print "@chunks\n";
