#!/usr/bin/env perl
use v5.36;

use Carp;

my ($word, $dict) = <animal words>;
my $word_hash = join '', sort split //, $word;
my $word_length = length $word_hash;
my @anagrams;

open my $fh, '<:encoding(UTF-8)', $dict;
while (my $dword = <$fh>) {
    chomp $dword;
    next if (length $dword != $word_length);

    my $dword_hash = join '', sort split //, $dword;
    next if ($dword_hash ne $word_hash);
    next if ($dword eq $word);

    push @anagrams, $dword;
}
close $fh;

say sprintf 'Word: %s', $word;
say sprintf 'Anagrams: %s', join q|, |, @anagrams;
