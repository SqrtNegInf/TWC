#!/usr/bin/env raku

subset PositiveInt of Int where * > 0;

unit sub MAIN (PositiveInt $A is copy = 238, PositiveInt $B is copy = 13, :v(:$verbose));

my $result = 0;

loop
{
  $result += $B unless $A %% 2;
  
  say ":: $A & $B" if $verbose;

  last if $A == 1;
  
  $A = $A div 2;
  $B = $B * 2;
}

say $result;
