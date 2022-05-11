#!/usr/bin/env raku

sub MAIN(
    @n = (1,5,4,3,2,6,7)
) {
    my @previous = @n[1 .. *];
    my $total;

    while @previous.elems {
        $total = @previous[0];
        my @next = ( $total );

        for 1 ..^ @previous.elems -> $i {
            $total += @previous[$i];
            @next.push($total);
        }

        @previous = @next[1 .. *];
    }

    say $total;
}
