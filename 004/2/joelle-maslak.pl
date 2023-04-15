#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;

# Turn on method signatures
use feature 'signatures';
no warnings 'experimental::signatures';

use autodie;

my $match = fc('crate');
my %dedupe;

my $filename = 'words';
open my $fh, '<', $filename;
while (my $word = <$fh>) {
    chomp($word);
    $word = fc($word);

    my $wordmatch = join '', sort split('', $word);

    if (partialmatch($match, $wordmatch)) {
        next if exists $dedupe{$word};
        $dedupe{$word} = 1;
        say $word;
    }
}

sub partialmatch($chars, $word) {
    my @chars = sort split '', $chars;
    my @word  = sort split '', $word;

    for my $c (@chars) {
        shift(@word) if ($word[0] // ' ') eq $c;
    }
    return ! @word;
}

