#!/usr/bin/env perl
use v5.36;

my @array = (5, 2, -2, 0);
my @positives = grep { $_ > 0 } @array ;
my %numhash ;
for my $num ( @positives ) {
  $numhash{$num}++ ;
}
my $current = 1 ;
while ( exists $numhash{ $current } ) {
  $current++ ;
}
say $current ;
