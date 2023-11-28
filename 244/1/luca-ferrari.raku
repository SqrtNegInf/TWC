#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my @nums = (8, 1, 2, 2, 3);
    my @result;
    @result[ $_ ] = @nums.grep( * > @nums[ $_ ] ).elems  for 0 ..^ @nums.elems;
    @result.say;
#}
