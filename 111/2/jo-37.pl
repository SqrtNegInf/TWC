#!/usr/bin/env perl
use v5.36;

our $n;
$n //= 1;


my @word;

open my $dict, '<', '/usr/share/dict/words';
while (<$dict>) {
    chomp;
    $_ = lc;
    # Detect a "self-sorted" word and add it to an array of words having
    # the same length.
    push $word[length]->@*, $_ if join('', sort split //) eq $_;
}

# Reverse the order of the collected arrays, pick the first
# $n + 1 thereof, dereference these and print the words.
# @word may contain gaps.
say for map {$_ ? @$_ : ()} (reverse @word)[0 .. $n-1];
