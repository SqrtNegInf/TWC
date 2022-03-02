#!/usr/bin/env raku

#sub MAIN( *@values where { @values.elems > 1 && @values.grep( * ~~ Int ).elems == @values.elems  } ) {
    my @values = (2, 5, 4, 4, 5, 5, 2);

    for @values -> $needle {
       $needle.say and last if  @values.grep( $needle ).elems !%% 2;
    }

    $_.say and exit if  @values.grep( $_ ).elems !%% 2 for @values;

#}
