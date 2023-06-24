#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my $word = 'animal';
my $list = 'words';
my $search = join q{}, sort split //, $word;

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

if (exists $anagrams{$search}) {
    say join q{ }, sort grep { $_ ne $word } @{ $anagrams{$search} };
}
