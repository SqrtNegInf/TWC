#!/usr/bin/env raku

die 'not ok - disabled: too slow';

my @pentagons = (1..*).map( { $_ * ((3 * $_)-1) / 2 });

my @vals = lazy gather {
    for (0..5000) -> $i {
print '.';
        for (0..^$i) -> $j {
            take (@pentagons[$i], @pentagons[$j], $i+$j);
        }
    }
};

@vals.race.grep(
    -> (\a, \b, \m) {
        my \check = Set(@pentagons[^m]);
        ((a - b) (elem) check) && ((a + b) (elem) check);
    }
).map( -> (\a, \b, \m) { ( a, b ) } ).first.say
