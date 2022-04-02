#!/usr/bin/env perl
use strict;
use warnings;
use v5.26;
#use DDP;

my @A = (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
my $S = 3;
my @O = ();

for (my $i=0; $i <= $#A; $i++)
{
  my $min = sliding($i);
  next unless defined $min;
  push @O, $min;
}

say join ',', @O;

sub sliding
{
  my $slide = shift;
  my @tmp = ();
  my $max = $S-1 + $slide;

  for ( my $i = $slide; $i <= $max; $i++ )
  {
    push @tmp, $A[$i] if defined $A[$max];
  }

  return (sort @tmp)[0];
}
