#!/usr/bin/env perl
use v5.36;

use Struct::Dumb;

struct Point => [qw( x y )];

sub point_in_triangle
{
     my ($pA, $pB, $pC, $pP) = @_;

     my $denominator_barycentric =
          (($pB->y - $pC->y)*($pA->x - $pC->x) + 
           ($pC->x - $pB->x)*($pA->y - $pC->y));

     my $coord_a = (($pB->y - $pC->y)*($pP->x - $pC->x) + 
                    ($pC->x - $pB->x)*($pP->y - $pC->y)) / 
                    $denominator_barycentric;

     my $coord_b = (($pC->y - $pA->y)*($pP->x - $pC->x) + 
                    ($pA->x - $pC->x)*($pP->y - $pC->y)) / 
                    $denominator_barycentric;
     my $coord_c = 1 - $coord_a -  $coord_b;


     if ( $coord_a >= 0 and $coord_a <= 1 and 
          $coord_b >= 0 and $coord_b <= 1 and 
          $coord_c >= 0 and $coord_c <= 1)

     {
          return 1;
     }
     return 0;

}

my $ORIGIN = Point(0, 0);


for my $triangle (  [[0, 1], [ 1, 0], [ 2,  2]],
                    [[1, 1], [-1, 1], [ 0, -3]],
                    [[0, 1], [ 2, 0], [-6,  0]] )

{
     my @points = map { Point($_->[0], $_->[1]) } @$triangle;
     print point_in_triangle( @points, $ORIGIN ), $/;
}
