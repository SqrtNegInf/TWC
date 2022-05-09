#!/usr/bin/env raku

sub MAIN(Int() $count = 20) {
    my @h = lazy gather {
        my @items = (1);
        loop {
            my $val = @items.shift;
            take $val;
            @items.push($val*2,$val*3,$val*5);
            @items = @items.unique.sort( { $^a <=> $^b } );
        }
    };
    say @h[0..$count-1]
}
