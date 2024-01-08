#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my @nums  = (0, 1, 2);
    $_.say and exit if ( @nums[ $_ ] == ( $_ % 10 ) ) for 0 ..^ @nums.elems;
    '-1'.say;
#}
