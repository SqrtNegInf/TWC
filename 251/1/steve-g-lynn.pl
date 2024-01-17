#!/usr/bin/env perl
use v5.36;

sub concatenation_value(@ints) {
  my($x,$retval)=(0,0);
  foreach $x (0 .. @ints/2-1) {
   $retval += $ints[$x] . $ints[$#ints-$x]; 
  }
  (@ints % 2) && ($retval += $ints[$#ints/2]);
  return $retval;
}

print &concatenation_value( 6,12, 25, 1),"\n"; #1286
print &concatenation_value( 10,7,31,5,2,2),"\n"; #489
print &concatenation_value( 1,2,10),"\n"; #112
