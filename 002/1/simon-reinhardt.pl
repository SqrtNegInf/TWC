#!/usr/bin/env perl
use v5.36;

use integer;

my $string = "-0123 abcd 001234 00 01 0023 -0123";
say $string;
$string =~ s/(?<!-)0+(?=[1-9][0-9]*)//g;
say $string;
