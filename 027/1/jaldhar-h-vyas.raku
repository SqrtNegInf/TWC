#!/usr/bin/env raku

sub MAIN($x1=1, $y1=1, $x2=3, $y2=3, $x3=1, $y3=3, $x4=3, $y4=1) {

    my $denominator = ((($x2 - $x1) * ($y4 - $y3)) - (($x4 - $x3) * ($y2 - $y1)));

    if ($denominator == 0) {
        say 'Lines do not intersect or intersect at multiple points.';
        return;
    }

    my $x = ((($x2 * $y1) - ($x1 * $y2)) * ($x4 - $x3)) -
        ((($x4 * $y3) - ($x3 * $y4)) * ($x2 - $x1)) /
        $denominator;

    my $y = ((($x2 * $y1) - ($x1 * $y2)) * ($y4 - $y3)) -
        ((($x4 * $y3) - ($x3 * $y4)) * ($y2 - $y1)) /
        $denominator;

    say "($x,$y)";
}
