#!/usr/bin/env perl
use v5.36;


srand 1;

my %six;

while (keys %six < 6)
{
  $six{ int(1+ rand(48)) } = 1;
}

foreach my $key (sort { $a <=> $b } keys %six)
{
  print "$key\n";
}
