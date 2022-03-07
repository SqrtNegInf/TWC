#!/usr/bin/env raku

#| return average of lists.
sub avg(*@list) { (sum @list) / @list.elems; }

#| average of stream at every point.
#sub MAIN(*@nums where {$_.all ~~ Int}) {
    my @nums =  <10 20 30 40 50 60 70 80 90 100>;
    put @nums.keys.map({avg @nums[0..$_]});
#}
