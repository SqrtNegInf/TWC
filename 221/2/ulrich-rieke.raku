#!/usr/bin/env raku

sub is_arithmetic ( @array ) {
  my $len = @array.elems ;
  my $start = @array[1] - @array[0] ;
  for (1..$len - 2) -> $i {
      if ( @array[ $i + 1 ] - @array[ $i ] != $start ) {
    return False ;
      }
  }
  return True ;
}

#count the number of 1's in the binary string
sub count_ones( $bin_str ) {
  my $ones = 0 ;
  for ( 0..$bin_str.chars( ) ) -> $i {
      if $bin_str.substr( $i , 1 ) eq '1' {
    $ones++ ;
      }
  }
  return $ones ;
}

#convert a binary string into a subset of an array
sub find_subset( $binary_str , @array ) {
  my $len = @array.elems ;
  my @subset ;
  for (0..$len - 1 ) -> $i {
      if ( $binary_str.substr($i , 1 ) eq '1' ) {
    @subset.push( @array[ $i ] ) ;
      }
  }
  return @subset ;
}

#prefix as many 0's as necessary
sub pad_zeroes( $binstr , $desired_len ) {
  my $len = $binstr.chars( ) ;
  my $padded ;
  if ( $len < $desired_len ) {
      $padded = '0' x ( $desired_len - $len ) ;
      $padded ~= $binstr ;
  }
  else {
      $padded = $binstr ;
  }
  return $padded ;
}

my @numbers = (9, 4, 7, 2, 10);
if ( is_arithmetic( @numbers ) ) {
  say @numbers.elems ;
}
else {
  my $len = @numbers.elems ;
  my $subset_number = 2 ** $len - 1 ;
  my $max_len = 0 ;
  for (0..$subset_number ) -> $num {
      my $binstr = $num.base( 2 ) ;
      my $ones = count_ones( $binstr ) ;
      my $padded_bin ;
      if ( $ones > 1 ) {
    if ( $binstr.chars( ) < $len ) {
        $padded_bin = pad_zeroes( $binstr , $len ) ;
    }
    else {
        $padded_bin = $binstr ;
    }
    my @selection = find_subset( $padded_bin , @numbers ) ;
    if ( is_arithmetic( @selection )) {
        my $sublen = @selection.elems ;
        if ( $sublen > $max_len ) {
          $max_len = $sublen ;
        }
    }
      }
  }
  say $max_len ;
}
