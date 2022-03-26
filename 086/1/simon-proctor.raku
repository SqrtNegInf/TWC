#!/usr/bin/env raku

#| Given a number and a list of integers return 1 if the numbert is the difference of any two
#| of the integers. Otherwise return 0.
sub MAIN (
    Int $A = 7, #= Difference to look for
    @N = (10, 8, 12, 15, 5)
) {
    # First attempt
    #say +so (any(@N) - any(@N) == $A);

    # This is about twice as fast when dealing with long lists
    say +so any(@N X- @N) == $A;
}
