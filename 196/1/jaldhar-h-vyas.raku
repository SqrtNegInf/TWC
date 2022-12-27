#!/usr/bin/env raku

my @list = <3 1 4 2>;
    #for 0 .. @list.end - 2 -> $i, $j, $k {
    for 0 .. @list.end - 2 -> $i {
        for $i ^.. @list.end - 1 -> $j {
            for $j ^.. @list.end -> $k {
                if @list[$i] < @list[$k] && @list[$k] < @list[$j] {
                    say "({(@list[$i], @list[$j], @list[$k]).join(q{, })})";
                    exit;
                }
            }
        }
    }

    say '()';
