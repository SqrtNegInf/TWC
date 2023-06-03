#!/usr/bin/env perl
use v5.36;

my %words;

open my $file, "<", "input" or die "Unable to open input: $!\n";
while (<$file>) {
  chomp;
  s/[."(),]|--|'s//g;
  for my $word (split /\s+/, $_) {
    $words{$word}++;
  }
}
close $file;

my %frequencies;
while (my ($word, $count) = each %words) {
  push @{$frequencies{$count}}, $word;
}

for my $count (sort { $a <=> $b } keys %frequencies) {
  say $count, " ", join(" ", sort $frequencies{$count}->@*);
}

