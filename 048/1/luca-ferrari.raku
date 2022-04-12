#!/usr/bin/env raku

# Implements the list rotation.
sub next-alive( @people, $current-person ) {
    my $next = $current-person;

    loop {
        $next++;
        $next = $next >= @people.elems ?? $next % @people.elems !! $next;
        return $next if @people[ $next ].defined;
    }
}



sub MAIN( Int :$how_many_people = 50 ) {

    # False means that the person does not have the sword,
    # True means she has
    # Nil means the person is died
    my @people = False xx $how_many_people;

    # give the sword
    @people[ 0 ] = True;

    while ( @people.grep( *.defined ) > 1 ) {
        # find out who has the sword
        my $killer      = @people.first: *.so, :k;
        # then find out the next person to kill
        my $killed      = next-alive( @people, $killer );
        @people[ $killed ] = Nil;  # killed!
        @people[ $killer ] = False; # pass the sword
        # now get the next person that will hold the sword
        my $next-killer = next-alive( @people, $killed );
        @people[ $next-killer ] = True; # the next killer
    }

    "The person who survives is { $_ + 1 }".say given @people.first: *.so, :k;
}
