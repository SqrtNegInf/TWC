#!/usr/bin/env raku

use Test;

my @Test =   #in             out
    (15, 99, 1, 34),        (1, 15, 34, 99),
    (50, 25, 33, 22),       (22, 33, 50, 25),
    (123457890, 123, 10,),  (10, 123, 123457890,),
;
my @Test-m-r = 
    1,                  0,
    10,                 1,
    123457890,          1,
    123,                1,
    1234,               2,
    2555,               2,
    1234578912345,      2,
    777,                4,
    999,                4,
;
plan ( @Test + @Test-m-r) ÷ 2;

subset Positive of Int where * ≥ 1;

# Return the count of successive multiplications of the digits of a number
# until the result is a single digit.
sub mult-reductions( Positive $n is copy --> Int ) {
    my $red;

    while $n > 9 {
        $n = [×] $n.comb;
        ++ $red;
    }
    $red // 0;
}

sub sort-by-mult-reds-then-value(@in ) {
    @in.sort( { .&mult-reductions, .Int} )
}

for @Test-m-r -> $in, $exp {
    is mult-reductions( $in.Int ), $exp, "$in to single digit takes $exp ops";
}

for @Test -> @in, @exp {
    my @result = @in.&sort-by-mult-reds-then-value;
    is @result, @exp, "@exp[] <- @in[]";
}

done-testing;

my @int = ( 1999,707, 50, 999, 777, 57, 9991);
say "\nInput: @int = @int[]\nOutput: &sort-by-mult-reds-then-value(@int)";
