#!/usr/bin/env perl
use v5.36;

my @outputlines ;
my $fh ;
open ($fh , "<" , 'phone-numbers.txt' ) or die "Can't open file 'numbers'" ;
while ( my $line = <$fh> ) {
  chomp $line ;
  if ( $line =~ m/^(\s*\+\d{2}|\d{4}|\(\d{2}\))\s\d{10}$/ ) {
      push @outputlines , $line ;
  }
}
close $fh ;
map {say} @outputlines ;
