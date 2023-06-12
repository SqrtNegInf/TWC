#!/usr/bin/env raku

multi sub is_perfect_square( Int $a, Int $b ) {
    ($a+$b).sqrt %% 1;
}

multi sub is_perfect_square( @ints ) {
    ( [&&] (0 .. @ints-2).map( {&is_perfect_square( @ints[$_], @ints[$_+1] ) } ) );   
}

sub squareful (@ints where @ints.elems==3) {
    @ints.permutations.unique( :with(&[eqv]) ).grep( {$_.&is_perfect_square} );
}

say &squareful((1,17,8)); #(1,8,17),(17,8,1)
say &squareful((2,2,2)); #((2 2 2) 
 
