#!/usr/bin/env raku

sub SumsTwelve(*@tri) {
    return True if ( [+] @tri ) == 12; # this will always fullfil condition one of number is even as can only add to twelve is ALL even or TWO odd. sum of all odd or one odd can never an even number!
    return False;
}

for 1..10 -> $a {
    for 1..11-$a -> $b {
        for 1..12-$b-$a -> $c {
            say "$a,$b,$c" if SumsTwelve($a,$b,$c);
        }
    }
}
