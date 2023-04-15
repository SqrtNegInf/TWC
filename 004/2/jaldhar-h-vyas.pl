#!/usr/bin/env perl
use v5.36;
#use warnings;
#use strict;
#use 5.010;
use English qw/ -no_match_vars /;

my $letters = 'crate';

open my $wordList, '<', 'words' or die "word.list: $!\n";
local $RS;
my $contents = <$wordList>;
close $wordList;
my @words = split /\n/, $contents;


foreach my $word (@words) {
    my $upword = uc $word;  # converting word and letter list to upper case
    my $used = uc $letters; # for case-insensitive comparisons.
    my $bogus = undef;
    for my $letter (split //, $upword) {
        if ($used !~ s/$letter//) {
            $bogus = 1;
            last;
        }
    }

    if (!$bogus) {
        say $word;
    }
}

