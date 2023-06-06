#!/usr/bin/env perl
use v5.36;

use Test::More tests => 5;

sub fnr {
    my @uniquestack;
    my %charcount;
    my $ans = "";
    my @characters = split //, $_[0];
    for my $char (@characters) {
        if (!exists $charcount{$char} ) {
            push @uniquestack , $char;
            $charcount{$char} = 1;
            $ans .= $char;
        } 
        else {
            $charcount{$char}++;
            @uniquestack = grep { $charcount{$_} == 1 } @uniquestack;
            $ans .= (scalar @uniquestack != 0) ? $uniquestack[-1]  : "#";
        }
    }
    return $ans;

}

#print fnr("$ARGV[0]");

is_deeply( fnr("ababc") , "abb#c", "example1 provided");
is_deeply( fnr("xyzzyx") , "xyzyx#", "example2 provided");
is_deeply( fnr("abcdef") , "abcdef", "trival");
is_deeply( fnr("aaabbb") , "a##b##", "repeats");
is_deeply( fnr(
  "thequickbrownfoxjumpsoverthelazydog") , 
  "thequickbrownffxjjmpssvvvvvvlazyddg",
  "long sentence"
);
