#!/usr/bin/env raku

#sub MAIN(*@list) {
my @list = (1,2,3,1,2,3);
    my @goodpairs;

    for 0 .. @list.end -> $i {
        for $i ^.. @list.end -> $j {
            if @list[$j] == @list[$i] {
                @goodpairs.push(($i, $j));
            }
        }
    }

    @goodpairs.elems.say;
#}
