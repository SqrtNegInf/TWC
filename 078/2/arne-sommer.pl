#!/usr/bin/env perl
use v5.36;

use feature 'say';
use feature 'signatures';
use Perl6::Junction 'all';

no warnings qw(experimental::signatures);

my @A = (10,20,30,40,50); my @B = (3,4);
map { say '[' . join(' ', do_rotate($_, @A)) . ']' } @B;

sub do_rotate ($length, @array)
{
  push(@array, shift @array) for 1..$length;
    
  return @array;
}
