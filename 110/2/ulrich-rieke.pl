#!/usr/bin/env perl
use v5.36;

my $fh ;
my @rows ;
my @transposed ;
open( $fh , "<" , "example.csv" ) or die "Can't open file 'input'!" ;
while ( my $line = <$fh> ) {
  chomp $line ;
  push @rows, $line ;
}
close $fh ;
my $len = scalar( split( /\,/ , $rows[0])) ;
for my $row (0 .. scalar( @rows ) - 1 ) {
  my @columns = split( /\,/, $rows[$row] ) ;
  for my $column (0 .. $len - 1 ) {
      push @{$transposed[ $column ]} , $columns[ $column ] ;
  }
}
for my $line ( @transposed ) {
  say join( ',' , @$line ) ;
}
