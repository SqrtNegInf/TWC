#!/usr/bin/env perl

use 5.026;
use strict;
use warnings;

say $& while 'bookkeeper' =~ /(.)\g1*/g;
