#!/usr/bin/env raku

my $firstLine = 'ab c';
my $secondLine = 'a bc';
$firstLine.subst-mutate( /\s+/ , '' , :g) ;
$secondLine.subst-mutate( /\s+/ , '' , :g) ;
say ( $firstLine eq $secondLine ) ;
