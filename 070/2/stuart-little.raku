#!/usr/bin/env raku

sub gray($n) {
    ($n==1) && return <0 1>.List;
    return (.map({ 0~$_}), .reverse.map({ 1~$_})).flat.List with gray($n-1);
}

say gray(4).map({ :2($_)});
