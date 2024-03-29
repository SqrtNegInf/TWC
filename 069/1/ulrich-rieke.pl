#!/usr/bin/env perl
use v5.36;

sub isStrobo {
  my $num = shift ;
  my %strobopairs = ( "6" => "9" , "8" => "8" , "9" => "6" , "0" => "0" ) ;
  my $len = length $num ;
  for my $i ( 0..$len - 1 ) {
      unless ( exists $strobopairs{ substr( $num, $i , 1 ) } ) {
    return 0 ;
      }
  }
  my $downside = join( '' , map { $strobopairs{ $_ } } reverse split( // ,
        $num ) ) ;
  return $downside eq $num ;
}

my $A = 1;
my $B = 200;
if ( $A > $B ) {
  print "No valid range! Second argument must be greater than first!\n" ;
  exit( 1 ) ;
}
map { print "$_\n" } grep { isStrobo( $_) } ($A..$B) ;
