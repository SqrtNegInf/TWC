#!/usr/bin/env perl
use v5.36;

# Input
my @words = ("opt", "bat", "saw", "tab", "pot", "top", "was");

# Group Anagrams
my %groups = ();

for my $word (@words) {
  my $sortedWord = join "", sort split //, $word;

  $groups{$sortedWord} = [] if(!defined $groups{$sortedWord});

  push @{$groups{$sortedWord}}, $word;
}

# Output
print "@$_\n" for (sort values %groups);
