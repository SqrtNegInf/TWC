#!/usr/bin/env raku

sub runinng-sum(@_) {
  [\+] @_
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (1, 2, 3, 4, 5), output => (1, 3, 6, 10, 15) },
        %{ input => (1, 1, 1, 1, 1), output => (1, 2, 3, 4, 5) },
        %{ input => (0, -1, 1, 2),   output => (0, -1, 0, 2) },
    ];

    for @tests {
        runinng-sum( .<input> ).&is-deeply: .<output>, .<text>;
    }
#} 
