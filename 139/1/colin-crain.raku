#!/usr/bin/env raku
#
#
#       .raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



#unit sub MAIN ( *@arr ) {
    my @arr = (^1000).pick(*);
     for @arr Z @arr.sort {
        say 0 and exit if $_[0] != $_[1];
     }
     say 1;
#}
