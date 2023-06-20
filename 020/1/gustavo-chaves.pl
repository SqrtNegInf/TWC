#!/usr/bin/env perl
use v5.36;

use 5.026;
use strict;
use warnings;

say $& while 'bookkeeper' =~ /(.)\g1*/g;
