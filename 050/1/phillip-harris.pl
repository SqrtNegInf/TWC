#!/usr/bin/env perl
use v5.36;

use Data::Dumper;

my @in =
  ( [ 2, 7 ], [ 3, 9 ], [ 10, 12 ], [ 15, 19 ], [ 18, 22 ] );

for ( my $x = 0 ; $x <= $#in ; $x++ ) {
    for ( my $y = 0 ; $y <= $#in ; $y++ ) {
        if ( $y == $x ) { next }
        my $s1 = $in[$x][0];
        my $e1 = $in[$x][1];
        my $s2 = $in[$y][0];
        my $e2 = $in[$y][1];
        my $splice;
        my $target;
        if (   ( $s2 >= $s1 and $s2 <= $e1 )
            or ( $e2 >= $s1 and $e2 <= $e1 )
            or ( $s2 <= $s1 and $e2 >= $s1 ) )
        {
            my @sort = sort { $a <=> $b } ( $s1, $e1, $s2, $e2 );
            if ( $y > $x ) { $splice = $y, $target = $x }
            if ( $y < $x ) { $splice = $x, $target = $y }
            my $temp = splice( @in, $splice, 1 );

 #print "splice $splice [@$temp[0],@$temp[1]] -> $target [$sort[0],$sort[3]]\n";
            $in[$target][0] = $sort[0];
            $in[$target][1] = $sort[3];
            $y--;
        }
    }
}
print Dumper(@in);
