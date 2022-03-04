#!/usr/bin/env raku
#
#
#       126-1-no-one-home.raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN ( $number = 200 ) ;


say (2..$number).grep({ !/1/ })
                .elems;
        

 


