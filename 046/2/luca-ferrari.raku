#!/usr/bin/env raku


sub MAIN( Int :$room-count = 500 ) {

    # create an hash with the rooms, the False status means they are closed,
    # while the True means they are open
    my %rooms = ( 1 .. $room-count).map: * => False;

    # every employee flips the status
    for 1 .. $room-count -> $employee {
        %rooms{ $_ } = ! %rooms{ $_ } if $_ %% $employee for 1 .. $room-count;
    }

    # now print out all the opened rooms
    say "Room $_ is Open" if %rooms{ $_ } for %rooms.keys.sort: *.Int <=> *.Int;

}
