#!/usr/bin/env perl
use v5.36;

use Perl6::Junction 'all';

my @A = <9 10 7 5 6 1>;

die "Please specify at least one element" unless @A;

die "Integers only" unless all(@A) == qr/^\d+$/;

my @B;

while (@A)
{
  my $a = shift @A;
  push(@B, $a) if $a > all(@A);  
}

say '(' . join(', ', @B)  . ')';
