#!/usr/bin/env raku
 
# bogus results

#my $list-size = (3..11).pick;
#my @list = (1..50).pick($list-size).sort.reverse;

#my @list = 19,11,9,7,20,3,17,16,2,14,1;
my @list = 2, 6, 1, 3;

say @list;
for (0..@list.end) {
    say "@list[$_] is noble." if @list[$_] == $_;
}
