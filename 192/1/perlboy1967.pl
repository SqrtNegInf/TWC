#!/usr/bin/env perl

use v5.16;
use warnings;

use Test::More;


sub binaryFlipString ($) {
  return oct('0b'.sprintf('%b',$_[0]) =~ tr/01/10/r);
}

sub binaryFlipBinary ($) {
  my ($i,$m) = ($_[0],0);

  # Create bitmask for 'AND' in 'return'
  while ($i) {
    $i >>= 1; 
    $m <<= 1;
    $m++;
  }

  return ~$_[0] & $m;
}
  

is(binaryFlipString(5),2);
is(binaryFlipString(5),2);
is(binaryFlipString(4),3);
is(binaryFlipString(6),1);
is(binaryFlipString(0b10101),0b1010);

is(binaryFlipBinary(5),2);
is(binaryFlipBinary(5),2);
is(binaryFlipBinary(4),3);
is(binaryFlipBinary(6),1);
is(binaryFlipBinary(0b10101),0b1010);
done_testing();
