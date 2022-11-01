#!/usr/bin/env raku

my @given = ([5,4], [4,6], [2,5], [3,1], [7,4]);
my $step;

sub steps( $x is copy, $y is copy ) {
  if ($x > $y) {
    $x = $x - $y;
  } elsif ($y > $x ) {
    $y = $y - $x;
  }
  $step++;
  if ( $x == $y) {
    $step++;
    say "Output: $step\n";;
    return;
   }
  steps($x,$y);
}

sub main {
  for (@given) -> $f {
    my $x = @$f[0];
    my $y = @$f[1];
    print("Input: \$x = $x,  \$y = $y\n");
    $step = 0;
    steps( $x, $y);
  }
}

main();
