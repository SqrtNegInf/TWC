#!/usr/bin/env raku

sub remove-one(@_) {
  (^+@_).map({[<] @_[|(^$_), |($_+1 ..^ +@_)]}).any.so
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (0, 2, 9, 4, 6), output => True },
        %{ input => (5, 1, 3, 2),    output => False },
        %{ input => (2, 2, 3),       output => True },
    ];

    for @tests {
        remove-one( .<input> ).&is-deeply: .<output>, .<text>;
    }
#}
