#!/usr/bin/env raku
#
#
#       .raku
#
#
#
#       © 2022 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



#unit sub MAIN ( *@list ) ;
my @list = (1,3,5,6,9);

.say for
    @list.sum / @list.elems,                            ## arithmetic
    @list.reduce({$^a * $^b})  ** (1/ @list.elems),     ## geometric
    @list.elems / ( sum map { 1/$_ }, @list );          ## harmonic


