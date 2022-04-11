#!/usr/bin/env raku

#my $size=@*ARGS[0]//3;
#my @list=(50.rand.Int+1 xx $size).sort;
my @list=(19,11,9,7,20,3,17,16,2,14,1);
put "Sorted input list: @list[]";
put "Noble Integers found: ",@list[(^@list).grep({(@list-$_-1) == @list[$_]})];
