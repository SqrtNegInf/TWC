#!/usr/bin/env raku

sub MAIN( Str $message where { .chars > 8 } = "The quick brown fox jumps over the lazy dog"
        , Int :$columns? where { $_ > 0 && $_ < $message.chars } = 8 ) {

    my @matrix = $message.lc.comb( /\w/ ).rotor: $columns, :partial;

    say "Your original message is \n\t$message\n and encoded results:\n";
    @matrix.join( "\n" ).say;
    say "\nthat leads to\n";
    for 0 .. $columns -> $start {
        ( @matrix[ $_ ][ $start ] // '' ).print for 0 .. @matrix.elems;
    }

    say "\n\nAll done!";
}
