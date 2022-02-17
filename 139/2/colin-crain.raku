#!/usr/bin/env raku
#
#
#       longpork.raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##












unit sub MAIN () ;


for ( 2..40 ) {
    my ($real, $reptend) = (1/$_).base-repeating(10);
    $reptend.chars == $_ - 1  
        ??  printf "%5d    %s \n", $_, $reptend
        !!  next    ;
}
    
