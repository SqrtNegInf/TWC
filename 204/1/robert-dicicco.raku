#!/usr/bin/env raku

my @nums = <1 2 2 3>,<1 3 2>,<6 5 5 4>;
sub CheckIncreasing (@arr, $len) {

    my $cnt = 0;

    while $cnt < $len - 1 {

        @arr[$cnt + 1] >= @arr[$cnt] ?? $cnt++ !! return 0;

    }

    return 1;

}

sub CheckDecreasing (@arr, $len) {

    my $cnt = 0;

    while $cnt < $len - 1 {

        @arr[$cnt + 1] <= @arr[$cnt] ?? $cnt++ !! return 0;

    }

    return 1;

}



for (@nums) -> @n {

    print "Input: \@nums = (",@n,")\n";

    my $len = @n.elems;

    say "0" if CheckIncreasing(@n,$len) == 0 and CheckDecreasing(@n,$len) == 0 ;

    say "1" if CheckIncreasing(@n,$len) == 1 or CheckDecreasing(@n,$len) == 1 ;

}
