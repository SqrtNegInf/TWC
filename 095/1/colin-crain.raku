#!/usr/bin/env raku
#
#
#       pal-n-done.raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN ($num is copy = 12344321) ;

$num += 0;

say
$num ~~ m:ex/^ (.*) {} .? "{$0.flip}" $/ ?? 1
                                         !! 0 ;
