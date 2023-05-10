#!/usr/bin/env perl
use v5.36;

my $file = "dictionary.txt" ;
open ( FH , "< $file" ) or die "Can't find input file!\n" ;
my @abecedearian ;
while ( my $line = <FH> ) {
  chomp $line ;
  if ( join( '' , sort { $a cmp $b } split(//, $line)) eq $line ) {
      push @abecedearian , $line ;
  }
}
close( FH ) ;
my @sorted = sort { length $b <=> length $a } @abecedearian ;
say join( ',' ,  @sorted ) ;
