#!/usr/bin/env raku

unit sub MAIN ( *@list ) ;

put and_sum( @list ) and exit if @list.elems > 0;

sub and_sum (*@list) {    
    @list.combinations(2).map({ [+&] |$_ }).sum
}


use Test;

is and_sum(1, 2, 3), 3, 'ex-1';
is and_sum(2, 3, 4), 2, 'ex-2';
is and_sum(1, 2, 3, 8+2), 7, 'ex-3';
