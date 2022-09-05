#!/usr/bin/env raku

#unit sub MAIN (Int $i, *@n where @n.elems > 0 && all(@n) ~~ Numeric);
my $i = 5;
my @n = (1,9,0,6,2,3,8,5,104,);

say @n.grep: * > $i;


