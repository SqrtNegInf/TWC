#!/usr/bin/env raku

sub is-power-of-three(Int $n is copy --> Bool) {

    return True if $n == 0;
    while $n %% 3 {
        $n div= 3;
    }
    return $n == 1;
}

# Tests
die "Test failed!" unless is-power-of-three(27) == True;
die "Test failed!" unless is-power-of-three(0) == True;
die "Test failed!" unless is-power-of-three(6) == False;
say "All tests passed!";
