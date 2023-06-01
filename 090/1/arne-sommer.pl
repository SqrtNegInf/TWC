#!/usr/bin/env perl
use v5.36;

my $dna = $ARGV[0] // 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';

my %legal = ( G => 1, T => 1, A => 1, C => 1);
my %count;

map { $count{$_}++ } split("", $dna);

for my $key (sort keys %count)
{
  die "Illegal character $key" unless $legal{$key};
  say "$key => " . $count{$key};
}

$dna =~ tr/TAGC/ATCG/;

say $dna;
