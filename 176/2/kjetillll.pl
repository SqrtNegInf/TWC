#!/usr/bin/env perl
use v5.36;

($_ + reverse) =~ /^[13579]+$/ and print"$_\n" for 1..99;
