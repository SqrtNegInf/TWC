#!/usr/bin/env perl
use v5.36;

my $msg = "The quick brown fox jumps over the lazy dog";

$msg =~ s/\s+//g;

my @lines = map { [ split // ] } $msg =~ /(.{1,8})/g;

for my $x (0 .. $#{$lines[0]}) {
  for my $y (0 .. $#lines) {
    print $lines[$y][$x] // '';
  }
  print ' ';
}

print "\n";
