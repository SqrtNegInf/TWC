#!/usr/bin/env raku

#sub MAIN(
my  @ints  = (3, 4, 2);
#) {
    my $ops = 0;

    while @ints.elems {
        if @ints[0] == @ints.min {
            @ints.shift;
        } else {
            @ints.push(@ints.shift);
        }
        $ops++;
    }

    say $ops;
#}
