#!/usr/bin/env raku


sub MAIN() {
    my @input = 2, 5, -1, 3;
    my @output;

    loop ( my $i = 0; $i < @input.elems; $i++ ){
        for $i ^..^ @input.elems {
             @output = @input[ $i .. $_ ] if ( ! @output || ( [*] @input[ $i .. $_ ] ) > ( [*] @output ) );
        }
    }

    say "Max product is { [*] @output }  made by { @output.join( ' x ' ) }";
}
