#!/usr/bin/env perl
use v5.36;

use Test::More;

my @grid = qw(x***x*xxxx 
              *********x 
              ****x*x*x* 
              ***xx***** 
              x***x****x);

say join "\n",'',@grid,'';
say solve(@grid);
say '';

sub solve {
  my @res = ();
  my @g = map { [ map { $_ eq 'x' ? 1 : 0 } split //, $_ ] } @_;

  my( $h, $w ) = ( $#_, -1 + length $_[0] );
  foreach my $y ( 0 .. $h ) {
    push @res, join '', map {
      $g[$y][$_] ? 'x' :
        ( $y    ? ( $_    ? $g[$y-1][$_-1] : 0 ) +
                            $g[$y-1][$_  ]       +
                  ( $_<$w ? $g[$y-1][$_+1] : 0 )
                : 0 ) +
                
                  ( $_    ? $g[$y  ][$_-1] : 0 ) +
                            $g[$y  ][$_  ]       +
                  ( $_<$w ? $g[$y  ][$_+1] : 0 ) +

        ( $y<$h ? ( $_    ? $g[$y+1][$_-1] : 0 ) +
                            $g[$y+1][$_  ]       +
                  ( $_<$w ? $g[$y+1][$_+1] : 0 )
                : 0 )
     } 0 .. $w;
  }
  return join "\n", @res;
}
