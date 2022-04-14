#!/usr/bin/env perl

use strict;
use warnings;
use feature qw /say/;

my $string = "The quick brown fox jumps over the lazy dog";
$string =~ s/\s//g;
my @chars = split('', $string);
my @new_words;

for my $i (0..scalar(@chars)-1) {
    $new_words[$i % 8] .= $chars[$i];
}

say join ' ', @new_words;
