#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/ say /;

my %word_count;
my $delimiter = "\t";

for my $file ('example.txt') {
    open my $fh, '<', $file or die "Can't open < $file: $!";
    while ( !eof $fh ) {
        my $word = readline $fh;
        chomp $word;
        $word_count{$word} += 1;
    }
}

my @word_count_desc
    = reverse sort { $word_count{$a} <=> $word_count{$b} } keys %word_count;

for my $word (@word_count_desc) {
    say "$word$delimiter$word_count{$word}";
}
