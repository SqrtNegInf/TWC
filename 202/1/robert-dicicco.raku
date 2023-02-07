#!/usr/bin/env raku

my @arrays = ([1,5,3,6],[2,6,3,5],[1,2,3,4],[2,3,5,7]);

for @arrays -> @arr {

    my $check = '';

    say "Input: \@array = ",@arr;

    loop (my $x = 0; $x < @arr.elems; $x++ ) {

        @arr[$x] % 2 == 0 ?? ($check ~= 'e') !! ($check ~= 'o');

    }

    $check.match(/ooo/) ?? say "Output: 1\n" !! say "Output: 0\n";

}
