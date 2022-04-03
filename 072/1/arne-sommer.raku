#!/usr/bin/env raku

subset PosInt of Int where * >= 1;

unit sub MAIN (PosInt $N = 10, :v(:$verbose), :u(:$upto) = 10);

my $faculty = 1;

for 1 .. $N -> $value
{
  $faculty *= $value;
  
  if $upto || $value == $N
  {
    say ": $value Faculty: $faculty" if $verbose;
    $faculty ~~ /(0*)$/;
    say $0.chars;
  }
}
