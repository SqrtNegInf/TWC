#!/usr/bin/env perl
use v5.36;

my @ARGV = ('1 2 3 3', '1 1 2 2');
my @bits=(1,2);
my %bitmasks;
for(0,1){
    my $bit=$bits[$_];
    $bitmasks{$_}|=$bit for split " ", $ARGV[$_];
}
my @results;
for(0,1){
    my $bit=$bits[$_];
    @{$results[$_]}=sort {$a <=> $b} grep{$bitmasks{$_}==$bit}keys %bitmasks;
}
say "[$ARGV[0]],[$ARGV[1]] -> [@{$results[0]}], [@{$results[1]}]";
