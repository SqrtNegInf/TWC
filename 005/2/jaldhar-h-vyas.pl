#!/usr/bin/env perl
use warnings;
use strict;
use 5.010;
use English qw/ -no_match_vars /;

my $list = 'words';

open my $wordList, '<', $list or die "$list: $!\n";
local $RS;
my $contents = <$wordList>;
close $wordList;
my @words = split /\n/, $contents;

my %dictionary;
foreach my $word (@words) {
    $dictionary{$word} = join q{}, sort split //, $word;
}

my %anagrams;
foreach my $key (keys %dictionary) {
    push @{ $anagrams{$dictionary{$key}} }, $key;
}

my @keys =
    reverse
    sort { scalar @{ $anagrams{$a} } <=> scalar @{ $anagrams{$b} } }
    keys %anagrams;

say join q{ }, sort @{ $anagrams{$keys[0]} };
