#!/usr/bin/env raku

sub det2x2(@a --> Int) {
   @a[1][1]*@a[0][0] - @a[1][0]*@a[0][1]
}

sub SOLUTION(@a) {
  my \D = det2x2 @a[(0, 1), (1, 2)];
  my \p = D R/ det2x2 @a[(2, 1), (3, 2)];
  my \q = D R/ det2x2 @a[(0, 2), (1, 3)];
  my \D2 = det2x2 @a[(1, 2), (2, 3)];
  my \p2 = D2 R/ det2x2 @a[(3, 2), (4, 3)];
  my \q2 = D2 R/ det2x2 @a[(1, 3), (2, 4)];
  p == p2 and q == q2 and p.denominator == 1 and q.denominator == 1
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (1, 1, 2, 3, 5),
           output => (True,) },
        %{ input =>  (4, 2, 3, 4, 7),
           output => (False,) },
        %{ input =>  (4, 1, 2, -3, 8),
           output => (True,) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#}


