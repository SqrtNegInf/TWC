#!/usr/bin/env perl
use v5.36;
use Algorithm::Combinatorics qw ( combinations ) ;
use List::Util qw ( sum ) ;

# answer differs from own Raku version, and others

my $row = '1 2 3 10' ;
chomp $row ;
while ( $row !~ /\s*(\d+\s)+/ ) {
  say "List should only contain numbers! Re-enter!" ;
  $row = <STDIN> ;
  chomp $row ;
}
my %created ;
my @numbers = split( /\s/ , $row ) ;
my $iter = combinations( \@numbers, 2 ) ;
while ( my $c = $iter->next ) {
  $created{join( ',' , @{$c})}++ ;
}
my $sum = 0 ;
for my $ref( keys %created ) {
  my @nums = split( /,/ , $ref ) ;
  $sum += $nums[0] & $nums[1] ;
}
say $sum ;
