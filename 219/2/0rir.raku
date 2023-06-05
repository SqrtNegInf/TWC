#!/usr/bin/env raku

use Test;

# For an array of travel dates (here day-numbers), a set of 3 prices and
# durations for travel passes, determine the lowest cost for all scheduled
# travel.
#
# TODO toward usefulness:
#   1) Use real Date dates.
#   2) Consolidate @price & @span into a Pass type.
#   3) Fancies like passes for a set period or set periods.

sub thrifty-pass( @travel-date, @price, @span -->Real) {
                      # Three sisters.
    my @date = @travel-date;    # value is date 
    my @cost;                   # value is date's expenditure
    my @ticket;                 # value is date's type of ticket, i.e its duration

    @date.push: ∞;              # A sink-hole in which to bury long look-a-heads.
    enum span < Day Week Mo >;
    my @cur-cost;           # candidate costs [day,week,month] for a @date element 

    @cost[@date.end] = 0;   # starting cost (in sink-hole)


    for  (@date.end-1)…0 -> $i {

        for ^@span -> $dur-idx {
            @cur-cost[$dur-idx] = @price[$dur-idx] + @cost[
                        @date.first( * ≥ @date[$i] + @span[$dur-idx], :k)
                        ];
       }

        my $best = @cur-cost.min;
        my $min-k = @cur-cost.first( * == $best, :k);
        @ticket[$i] = @span[$min-k];
        @cost[$i] = @cur-cost[$min-k];
    }
    return  @cost[0];
}


my @Test =
#   spans      prices        ydays                                      cost

    # varied prices
    [[1,7,30], [2,5,20], [39,53,174,202,208,240,244,278,340,342],        20,],
    [[1,7,30], [2,6,19], [1,2,3,5,7,10,11,12,14,20,30],                  16,],
    [[1,7,30], [2,7,19], [1,2,3,5,7,10,11,12,14,20,30],                  18,],
    [[1,7,30], [2,7,13], [1..14],                                        13,],
    [[1,7,30], [2,7,13], [1..31],                                        15,],
    [[1,7,30], [2,7,20], [1..14],                                        14,],
    [[1,7,30], [3,7,19], [1,2,3,5,7,10,11,12,14,20,30],                  19,],
    [[1,7,30], [3,5,20], [39,53,174,202,208,240,244,278,340,342],        27,],

    # 2 7 25
    [[1,7,30], [2,7,25], [1,],                                            2,],
    [[1,7,30], [2,7,25], [1,2],                                           4,],
    [[1,7,30], [2,7,25], [1..3],                                          6,],
    [[1,7,30], [2,7,25], [1..4],                                          7,],
    [[1,7,30], [2,7,25], [1..7],                                          7,],
    [[1,7,30], [2,7,25], [1..8],                                          9,],
    [[1,7,30], [2,7,25], [1,2,3,5,7,10,11,12,14,20,30,31],               20,],
    [[1,7,30], [2,7,25], [1,2,3,5,7,10,11,12,14,20,30,31],               20,],
    [[1,7,30], [2,7,25], [39,53,174,202,208,240,244,278,340,342],        20,],

    [[1,7,30], [2,7,25], [  |(1..7), |(10..14), |(30..59), 71,
                        194,195,196,197,198,199,200,
                        201,202,203,204,205,
                        208,    210,        213,214,
                        215,216,        219,220,221,
                        222,                227,228,
                        229,230,
                                238],                                    75,],
;

plan +@Test;

for @Test -> ( @span, @price, @travel-day, $cost ) {
    is thrifty-pass( @travel-day, @price, @span), $cost,
            "$cost <- @travel-day.raku()";
}

done-testing;
my @pass = 1,7,30;
my @cost = 2, 7, 25;
my @day  = 1, 2, 3, 5, 7, 10, 11, 12, 14, 20, 30, 31;

say "\nInput:\t@pass = @pass.raku()\n\t@cost = @cost.raku()\n\t"
  ~ "@day  = @day.raku()\nOutput:\t", thrifty-pass( @day, @cost, @pass);
exit;
