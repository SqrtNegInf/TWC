#!/usr/bin/env perl
use v5.36;

my $s = 'raku Yearly Challenge';
my %freq;

map { $freq{$_}++ } split(//, $s);

for my $index (0 .. length($s) -1)
{
  my $char  = 
  my $count = $freq{substr($s, $index,1)};

  if ($count == 1)
  {
    say $index;
    last;
  }
}
