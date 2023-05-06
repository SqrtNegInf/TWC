#!/usr/bin/env perl
use v5.36;
use POSIX ;

sub findMedian {
  my $array = shift ;
  my $median ;
  my $size = scalar( @$array ) ;
  if ( $size == 2 ) {
      $median = ( $array->[0] + $array->[1] ) / 2 ;
  }
  if ( $size % 2 == 0 && $size > 2 ) {
      $median = ( $array->[ floor( $size / 2 ) - 1 ] +
        $array->[ floor( $size / 2 )]) / 2 ;
  }
  if ( $size % 2 != 0 ) {
      $median = $array->[ floor( $size / 2 ) ] ;
  }
  return $median ;
}

my @numbers = 0..11;
my $size = scalar( @numbers ) ;
my @sorted = sort { $a <=> $b } @numbers ;
say "Minimum is $sorted[0]!" ;
my $median = findMedian( \@sorted ) ;
say "Median is $median!" ;
my @slice ;
my @secondSlice ;
if ( $size % 2 == 0 ) {
  @slice = @sorted[0 .. $size / 2 - 1] ;
  @secondSlice = @sorted[ $size / 2 .. $size - 1] ;
}
else {
  @slice = @sorted[0 .. floor( $size / 2 )] ;
  @secondSlice = @sorted[floor( $size / 2 ) .. $size - 1 ] ;
}
my $firstQuartile = findMedian( \@slice ) ;
say "First quartile is $firstQuartile!" ;
my $thirdQuartile = findMedian( \@secondSlice ) ;
say "Third quartile is $thirdQuartile!" ;
say "Maximum is $sorted[-1]!" ;
