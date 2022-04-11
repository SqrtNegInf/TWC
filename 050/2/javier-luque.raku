#!/usr/bin/env raku

sub MAIN() {
    my $list_size = 50;

    # Create @L
    my @L = 19,11,9,7,20,3,17,16,2,14,1;
    #my @L = ((1 .. 50).roll: $list_size) ;

    # Output the list
    say 'List: ' ~ @L.perl;

    # Find Noble number
    my $noble =
        @L.sort.pairs.grep(
            {.key == $list_size - .value}
        )>>.value;

    # Output it if found
    say "Noble found: " ~ $noble
        if ($noble);
}
