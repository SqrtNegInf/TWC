#!/usr/bin/env raku

unit sub MAIN(IO(Str:D) $file = 'input.txt', Int:D $a =3 , Int:D $b =6 ) {
    .say for $file.slurp.lines.pairs.grep($a <= *.key + 1 <= $b).map(*.value);
}
