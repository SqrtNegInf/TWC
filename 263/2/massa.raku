#!/usr/bin/env raku

sub SOLUTION(@x, @y) {
  my &a2b = { @^a».pairup.Bag }
  my &b2a = { %^b.list».kv.sort }
  b2a( @x.&a2b ⊎ @y.&a2b )
}

#multi MAIN (Bool :$test!) {
    use Testo;

    my @tests =
        %{ input =>  ( ((1, 1), (2, 1), (3, 2)), ((2, 2), (1, 3)) ),
           output => ((1, 4), (2, 3), (3, 2)) },
        %{ input =>  ( ( (1,2), (2,3), (1,3), (3,2) ), ( (3,1), (1,3) ) ),
           output => ( (1,8), (2,3), (3,3) ) },
        %{ input =>  ( ( (1,1), (2,2), (3,3) ), ( (2,3), (2,4) ) ),
           output =>  ( (1,1), (2,9), (3,3) ) },
    ;

    SOLUTION(|.<input>).&is: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
