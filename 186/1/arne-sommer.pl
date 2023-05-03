#! /usr/bin/env perl

use v5.36;

my @a    = qw/1 2 3/;
my @b    = qw/a b c/;
my @zip1 = zip(\@a, \@b);
my @zip2 = zip(\@b, \@a);

say 'qw/' . join(" ", @zip1) . '/;'; 
say 'qw/' . join(" ", @zip2) . '/;'; 

sub zip ($a, $b)
{
  my @return;
    
  for my $index (0 .. @$a -1)
  {
    push(@return, $a->[$index]);
    push(@return, $b->[$index]);
  }

  return @return;
}
