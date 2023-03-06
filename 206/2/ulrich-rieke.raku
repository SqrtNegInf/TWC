#!/usr/bin/env raku

#is every first number of a pair not greater than its right neighbour ?
#to check that, we look at non-overlapping pairs of two
sub is_valid( $permu ) {
  my $len = $permu.elems ;
  my $i = 0 ;
  while ( $i != $len ) {
      if ($permu[ $i ] > $permu[ $i + 1 ] ) {
    return False ;
      }
      else {
    $i += 2 ; #pairs must not overlap
      }
  }
  return True ;
}

my @numbers = [1,2,3,4,5,6];
my $len = @numbers.elems ;
my @permus = (0..$len - 1).permutations ;#all permutations of positions
my @valids = @permus.grep( {is_valid( $_ )} ) ;#these are valid
my $maximum = 0 ;
for @valids -> $v {
  my @minima ;
  my $i = 0 ;
  while ( $i != $len ) {
      @minima.push( (@numbers[ $v[ $i ] ] , @numbers[ $v[$i + 1]]).min ) ;
      $i += 2 ;
  }
  my $sum = @minima.sum ;
  if ( $sum > $maximum ) {
      $maximum = $sum ;
  }
}
say $maximum ;
