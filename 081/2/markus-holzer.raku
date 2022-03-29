#!/usr/bin/env raku
unit sub MAIN( $file where $file.IO.f = 'input.txt' );

my @ignore = <. ! ? " ( ) , 's -->;

my $words = $file
    .IO
    .slurp
    .subst( /@ignore/, ' ', :g )
    .words
    .Bag
    .classify( *.value );

say "{$_} : {sort $words{$_}>>.key}"
    for sort keys $words;
