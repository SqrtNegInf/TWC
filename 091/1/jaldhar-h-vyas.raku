#!/usr/bin/env raku

sub MAIN(
    #Int $N = 1122234
    Int $N = 4322211
) {
    my %count = $N.comb.classify({ $_; });
 
    for %count.keys.sort -> $k {
        print %count{$k}.elems, $k;
    }
 
    print "\n";
}
