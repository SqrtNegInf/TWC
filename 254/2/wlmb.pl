#!/usr/bin/env perl
use v5.36;

for('Juniper'){
    my @all = split "", lc $_;
    my @vowel_indices=grep {$all[$_]=~/[aeiou]/} 0..@all-1;
    @all[@vowel_indices]=reverse @all[@vowel_indices];
    my $out=ucfirst join "", @all;
    say "$_ -> $out";
}
