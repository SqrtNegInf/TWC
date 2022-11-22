#!/usr/bin/env raku

# why the awkward input requirement?

my rule integer { 0 | '-'? <[1..9]> <[0..9]>* };
subset IntList of Str where /^ '(' <integer>* % [\s* ',' \s*] ')' $/;

sub MAIN($input  = '(2,6,3,1)' ) {
  die 'Please provide a valid integer list as input.' unless $input ~~ IntList;
  my @list <==
    $<integer>
    .map: *.Int;
  my $biggest = @list.max;
  my $second = @list.grep(* != $biggest).max;  
  $biggest >= 2 * $second ?? 1 !! -1 andthen
    .say;
}
