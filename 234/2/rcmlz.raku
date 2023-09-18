#!/usr/bin/env raku

say solution (4, 4, 2, 4, 3);

our sub solution(@input) is export {
    @input.Bag.combinations(3).map( *.map( *.value ).reduce(&infix:<*>)).sum
}
