#!/usr/bin/env perl
use v5.36;

my @ARGV = (1024, 512, 256, 128, 64);
my @sorted = sort {ones($a) <=> ones($b) || $a<=>$b} @ARGV;
say "@ARGV -> @sorted";

sub ones($x){
    0+grep{$_}split "", sprintf "%b",$x;
}
