#!/usr/bin/env raku

use Test;

sub MAIN( @list = ([1,2], [3,4], [5,6], [1,2])) {
   say "Input: \@list = @list.raku()";
   say "Output: ", @list.unique( :with( &[eqv])).List.raku;
}
