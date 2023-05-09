#!/usr/bin/env perl
use v5.36;

use File::Slurper qw< read_lines >;

my $dict = $ARGV[0] // 'dictionary.txt';

say for map {     y/olist/01157/r    }
       grep { /^[0-9a-folist]{2,8}$/ } read_lines($dict);
