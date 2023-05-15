#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
 [ [qw(peon          perl raku    python)], 2 ],
 [ [qw(goat          love hate    angry )], 3 ],
 [ [qw(accommodation come nation  delta )], 4 ],
 [ [qw(accommodation come country delta )], 0 ],
);

sub word_stickers {
  my( %f, %s, $k, $n, $l, $x );
  $f{$_}++ for split //, shift;
  my @q = [ 1, 0, my %t = %f ];
  map { delete $t{$_} } split // for @_;
  return 0 if keys %t;
  while( ( $n, $l, %f ) = @{ shift @q } ) {
    push @q, map {
      $x = 0, %t = %f;
      exists $t{$_} && ( $x=1, --$t{$_} || delete $t{$_} )
        for split//, $_[$_];
      !%t ? return $n : $x ? [ $n+1, $_, %t ] : ()
    } $l..$#_;
  }
}

is(      word_stickers(        @{$_->[0]} )    , $_->[1] ) for @TESTS;
done_testing();
