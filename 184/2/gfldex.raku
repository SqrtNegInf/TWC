#!/usr/bin/env raku
# https://gfldex.wordpress.com/2022/10/03/recursive-cinderella/

for ( 'a 1 2 b 0', '3 c 4 d'), ( '1 2', 'p q r', 's 3', '4 5 t') -> @a is copy {
    @a.=map: *.split(' ').cache;
    my @numbers = @a.deepmap({ / <[0..9]> / ?? .Numeric !! Empty }).grep(+*)».Array;
    my @letters = @a.deepmap({ / <[a..z]> / ?? .Str !! Empty }).grep(+*)».Array;
    say @numbers, ‘ and ’, @letters;
}
