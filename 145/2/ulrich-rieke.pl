#!/usr/bin/env perl
use v5.36;

sub contains {
  my $words = shift ;
  my $searched = shift ;
  my @nums = @$words ;
  for my $num ( @nums ) {
      if ( $searched eq $num ) {
    return 1 ;
      }
  }
  return 0 ;
}

sub isPalindrome {
  my $word = shift ;
  return $word eq join( '' , reverse split( // , $word )) ;
}

my $s = 'redivider'; #$ARGV[0] ;
my @palindromes ;
my $len = length( $s ) ;
for my $let ( 0 .. $len - 1 ) {
  unless ( contains( \@palindromes , substr( $s , $let , 1 ))) {
      push @palindromes , substr( $s , $let , 1 ) ;
  }
  my $diff = $len - $let ;
  while ( $diff > 1 ) {
      my $wordpart = substr( $s , $let , $diff ) ;
      if ( isPalindrome( $wordpart ) && not contains( \@palindromes ,
          $wordpart)) {
    push @palindromes, $wordpart ;
    last ;
      }
      else {
    $diff-- ;
      }
  }
}
say join( ' ' , @palindromes ) ;
