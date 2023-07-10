#!/usr/bin/env perl
use v5.24;

use strict;

my ($source, $target) = @ARGV;
my %chars;

foreach (split //, $source) {$chars{$_}++}

foreach (split //, $target) {
    if ($chars{$_}) {
        $chars{$_}--;
    } else {
        say 'false' and exit;
    }
}
say 'true';
