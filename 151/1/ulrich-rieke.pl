#!/usr/bin/env perl
use v5.36;

my $tree = '1 | 2 3 | 4 * * 5 | * 6'; #<STDIN> ;
chomp $tree ;
my $len = length $tree ;
my $mindepth = 0 ;
for my $pos (0 .. $len - 1 ) {
  if ( substr( $tree , $pos , 1 ) eq '|' ) {
      $mindepth++ ;
  }
}
say $mindepth ;
