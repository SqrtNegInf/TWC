#!/usr/bin/env raku

#| natural numbers that don't contain digit 1
sub MAIN(UInt $N where * > 1 = 200) {
    print .join: ', ' with (1..$N).grep(*.comb.grep(1).elems == 0);
    put '.';
}
