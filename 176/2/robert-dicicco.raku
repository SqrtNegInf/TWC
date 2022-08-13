#!/usr/bin/env raku

sub MAIN() {

  for 10..^100 -> $num {

    my $newnum = $num.comb.join + $num.comb.reverse.join;

    print "$num " if AllDigitsOdd($newnum);

  }

  print "\n";

}

sub AllDigitsOdd( $d ) {

  my @candidate = $d.comb;

  for ( @candidate ) -> $c {

    if $c % 2 == 0 {

      return False;

    }

  }

  return True;

}
