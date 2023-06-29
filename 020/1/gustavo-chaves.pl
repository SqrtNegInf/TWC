#!/usr/bin/env perl
use v5.36;

say $& while 'bookkeeper' =~ /(.)\g1*/g;
