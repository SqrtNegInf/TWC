#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';
use Getopt::Long;
use Perl6::Junction 'all';

my $verbose =  0;

GetOptions("verbose" => \$verbose);

my @n = (1, 3, 5, 7, 9);

die "Positive integers only" unless @n && all(@n) == qr/^\d+$/;

my $elems = @n;

for my $equilibrium (1 .. $elems -2) 
{
  my @first  = @n[0 .. $equilibrium -1];
  my @second = @n[$equilibrium +1 .. $elems -1];

  say ": @first :: @second" if $verbose;

  if (sum(@first) == sum(@second))
  {
    say $equilibrium;
    exit;
  }
}

say -1;
