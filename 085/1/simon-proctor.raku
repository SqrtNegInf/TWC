#!/usr/bin/env raku

subset URat of Rat where * > 0;

# Given a list of positive numbers return 1 if 3 of them add up to a value between 1 and 2. Otherwise return 0. 
sub MAIN (
    @R = (1.2, 0.4, 0.1, 2.5)
) {
    (so (1 < any(@R.combinations(3).map( -> @c { [+] @c } ) ) < 2)).Int.say;
}
