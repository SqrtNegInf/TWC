#!/usr/bin/env raku

sub circumfix:<⎣ ⎦>( Numeric $n ) {
    $n.floor ;
}

unit sub MAIN (@A=(1, 2, 2, 3, 2, 4, 2));

@A = 1, 2, 2, 3, 2, 4, 2 if @A.elems == 0;
my %count;
%count{$_}++ for @A;

# is count of first elem count larger than half list size?
my $max = @A.max:{ %count{$_} };
say %count{$max} > ⎣@A.elems/2⎦ ?? $max !! -1 ;


