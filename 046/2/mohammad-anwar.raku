#!/usr/bin/env raku

sub MAIN() {

    my @rooms = 1 x 500;
    for 2 .. 500 -> $employee {
        my $room_number = $employee;
        while $room_number <= 500 {
            @rooms[$room_number] = (@rooms[$room_number]) ?? 0 !! 1;
            $room_number += $employee;
        }
    }

    .say unless @rooms[$_] for 1..500;
}
