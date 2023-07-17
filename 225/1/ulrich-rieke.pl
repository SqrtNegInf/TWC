#!/usr/bin/env perl
use v5.36;

use List::Util qw ( max ) ;

my @sentences = ("Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference.");
my @lengths ;
for my $sentence ( @sentences ) {
  my @words = split( /\s/ , $sentence ) ;
  push @lengths, scalar( @words ) ;
}
say max( @lengths ) ;
