#!/usr/bin/env perl
use v5.30;
my @words = ("one.two.three","four.five","six");
my $separator = '.';
#my @words = ('$perl$$', '$$raku$');
#my $separator = '$';
my $word = join(" ", @words);
my $s = "\\$separator";
$word =~ s/$s/ /g;
my @word = split " ", $word;
say "@word";