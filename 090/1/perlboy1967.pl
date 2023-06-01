#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

my %dnaMapping = (qw(T A A T G C C G));

@ARGV = (qw(GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG))
  unless (@ARGV);

my ($D) = @ARGV;

die "Not a valid DNA sequence"
  if ($D =~ m#[^ATCG]#);

printf "Input:  %s\n", $D;

$D =~ s#(.)#$dnaMapping{$1}#g;

printf "Output: %s\n", $D;

