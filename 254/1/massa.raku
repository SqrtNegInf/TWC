#! /usr/bin/env raku

sub SOLUTION($n) {
   (^∞).map(3 ** *).first(* >= $n) == $n
}

#multi MAIN (Bool :$test!) {
    use Testo;

    my @tests =
        %{ input =>  27,
           output => True },
        %{ input =>  0,
           output => False },
        %{ input =>  6,
           output => False },
    ;

    .<input>.&SOLUTION.&is-eqv: .<output>, .<text> for @tests;
#} # end of multi MAIN (Bool :$test!)

exit;

