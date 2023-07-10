#!/usr/bin/env perl
use v5.36;

my ($source, $target) = ("scriptinglanguage", "pear");
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
