#!/usr/bin/env perl
use v5.36;

open LITERATURE, "<", "input";

my %wordcount;

while (<LITERATURE>) {
    s/(\.|"|\(|\)|,|'s|--)/ /g;
    for my $chunk (split) {
        $wordcount{$chunk}++;
    }
}

my %wordfreq;

foreach my $word (sort keys %wordcount) {
    $wordfreq{$wordcount{$word}}.= " $word";
}

foreach my $i (sort keys %wordfreq) {
    print $i,$wordfreq{$i},"\n\n";
}
