#!/usr/bin/env raku

my @files = '../00-blogs';
    my %letter_count;
    %letter_count<a b c d e f g h i j k l m
                  n o p q r s t u v w x y z> = 0 xx *;

    for @files -> $file {
        for $file.IO.comb -> $letter {
            if (%letter_count{$letter.lc}:exists) {
                %letter_count{$letter.lc}++;
            }
        }
    }

    for %letter_count.sort(*.key)>>.kv -> ($letter, $count) {
        say "$letter: $count";
    }
