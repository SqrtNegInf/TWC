#!/usr/bin/env perl
use v5.36;

my @A = ('AB1 2CD', 'abc', 'abcd', 'bcd');

my %reg;
foreach (split(//, shift @A)) {
    my ($char) = ($_ =~ /([[:alpha:]])/);
    $reg{lc($char)}++ if $char;
}

WORD:
foreach (@A) {
    my $word = $_;
    MATCH:
    foreach (keys %reg) {
        my $char = $_;
        my $count = $reg{$_};

        next WORD if $word !~ /${char}{$count,}/;
    }
    say $word;
}
