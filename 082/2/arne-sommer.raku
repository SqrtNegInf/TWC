#!/usr/bin/env raku

unit sub MAIN (Str $A = 'XXY', Str $B = 'XXZ', Str $C = 'XXXXZY',
               :v(:$verbose));

say do_check($A, $B, $C) ?? '1' !! '0';

sub do_check ($A, $B, $C)
{
  say ": Checking A:$A | B:$B | C:$C" if $verbose;

  return 1 if $C eq "";

  if $C.contains($A)
  {
    my $c = $C.subst($A);
    return do_check($A, $B, $c);
  }
  
  if $C.contains($B)
  {
    my $c = $C.subst($B);
    return do_check($A, $B, $c);
  }  
}


