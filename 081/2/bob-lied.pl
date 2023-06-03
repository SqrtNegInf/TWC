#!/usr/bin/env perl
use v5.36;

use File::Slurper qw/ read_text /;


#jsub Usage { "Usage: $0 filename" };

my $InFile = 'input.txt';

# It would be friendlier to allow stdin, but the spec says use a file.
die Usage() unless $InFile;

# Slurp input file into one long string.
my $input = read_text($InFile);

# Split on word separators, and convienently get rid of them.
# That might leave some empty strings, so filter those.
my @words = grep !/^$/, split(/\s|[\n\r."(),]/, $input);

# These next two cleanups could be chained to make one pass,
# but let's keep it readable for now.
#
# Phrases separated by long dashes turn into multiple words.
@words = map { if (/--/) { split(/--/) } else { $_ } } @words;

# Possessives reduce to the base noun.
@words = map { s/'s//; $_ } @words;

my %counts;
$counts{$_}++ foreach @words;

# Invert the hash to have counts as keys to lists of words.
my %countList;
for my $word ( keys %counts )
{
    push @{$countList{ $counts{$word} }}, $word;
}

# Numeric sort ascending on the counts.
for my $n ( sort { $a <=> $b } keys %countList )
{
    say "$n\t", join " ", sort @{$countList{$n}}
}

