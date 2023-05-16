#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw ( permutations ) ;
use Math::BigInt ;
use Math::BigFloat ;

sub isPerfectSquare {
  my $number = shift ;
  my $floater = Math::BigFloat->new( "$number" ) ;
  $floater->bsqrt( ) ;
  return ( $floater->is_int( ) ) ;
}

my $N = 10; #$ARGV[0] ;
my @bases = ('0' .. '9') ;
push @bases , ('A' .. 'Z') ;
my @possibleDigits = @bases[0 .. $N - 1] ;
my @reversed = reverse @possibleDigits ;
my $iter = permutations( \@reversed ) ;
while ( my $c = $iter->next ) {
  my $num = join( '' , @$c ) ;
  my $toBase10 = Math::BigInt->from_base( $num , $N ) ;
  if ( isPerfectSquare( $toBase10 ) ) {
      say $num ;
      exit( 0 ) ;
  }
}
say "No perfect square with different digits for this base!"
