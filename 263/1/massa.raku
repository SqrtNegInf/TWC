#!/usr/bin/env raku

sub SOLUTION(\k, +a) {
  a.sort.grep: * == k, :k
}

#multi MAIN (Bool :$test!) {
    use Testo;

    my @tests =
        %{ input =>  (2, (1, 5, 3, 2, 4, 2)),
           output => (1, 2) },
        %{ input =>  (6, (1, 2, 4, 3, 5)),
           output => () },
        %{ input =>  (4, (5, 3, 2, 4, 2, 1)),
           output => (4,) },
    ;

    SOLUTION(|.<input>).&is: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)


