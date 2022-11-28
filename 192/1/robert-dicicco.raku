#!/usr/bin/env raku

my @ns = (5,4,6, 2⁶⁴ +1); # doesn't handle big one correctly

for @ns -> $n {

  my @out = ();

  say "Input: \$n = $n";

  my @binvals = split("",sprintf("%03b", $n) );

  for @binvals[1..3] -> $v {

    $v == 0 ?? @out.push(1) !! @out.push(0);

  }

  my $outj = @out.join;

  my $intval = ":2<$outj>".Int;

  say "Output: $intval\n";

}
