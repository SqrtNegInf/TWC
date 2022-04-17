#!/usr/bin/env raku

sub prcs_stack(@stack,$token) {
    ($token.Real) ?? (|@stack, $token) !! (|@stack[0..^*-2], @stack.[*-2..*-1].join($token).EVAL)
}

say (reduce &prcs_stack, [], |<15 7 1 1 + - / 3 * 2 1 1 + + ->)
