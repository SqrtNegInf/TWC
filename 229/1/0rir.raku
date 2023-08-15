#!/usr/bin/env raku

use Test;

my @Test =
    1, ("abc", "bce", "cae"),
    2, ("yxz", "cba", "mon"),
    3, «bac bcd ced def feg»,
    4, «bac cbd ced def feg»,
    5, «bac cbd ced edf feg»,
    0, «abc bcd cde def efg»,
    0, «A Bb cCc ddDd eeeeE»,
;

plan @Test ÷ 2;

sub func( @w -->Int) {
 #  +@w.grep: {             .fc.comb.sort.join() ~~ ( $_.fc, .fc.flip).none};
   +@w.grep: {my $w = $_; $w.fc.comb.sort.join() ~~ ( $w.fc, $w.fc.flip).none};
}

for @Test -> $exp, @in {
    is func(@in), $exp, "$exp <- @in.raku()";
}
done-testing;

my @str = «a b cc ccC aBc cba ab cb»;
say "\nInput: @str = @str[]\nOutput: &func(@str)";

exit;

