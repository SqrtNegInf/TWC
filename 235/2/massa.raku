#!/usr/bin/env raku

die 'Not working';

sub duplicate-zeros(@_) {
  @_.map(* || |(0, 0) ).head: +@_
}
# there is a regex-based solution I love but I understand other ppl will hate:
# S:g/<|w>0<|w>/0 0/.words.head: +@x given ~@x

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (1, 0, 2, 3, 0, 4, 5, 0), output => (1, 0, 0, 2, 3, 0, 0, 4) },
        %{ input => (1, 2, 3),                output => (1, 2, 3) },
        %{ input => (0, 3, 0, 4, 5),          output => (0, 0, 3, 0, 0) },
    ];

    for @tests {
        duplicate-zeros( .<input> ).&is-deeply: .<output>, .<text>;
    }
#}
