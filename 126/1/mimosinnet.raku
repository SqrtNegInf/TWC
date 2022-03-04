#!/usr/bin/env raku

my $tab = " " x 5;

sub challenge( UInt $n ) {
  return (1..$n).grep( * !~~ /1/);
}

#multi sub MAIN( 'test' )  is hidden-from-USAGE {
  use Test;

  my @test = (
    (15, <2 3 4 5 6 7 8 9> ),
    (25, <2 3 4 5 6 7 8 9 20 22 23 24 25>)
  );

  for @test -> ($a, $b) {
    is challenge($a), $b;
  }

  done-testing;

#}
