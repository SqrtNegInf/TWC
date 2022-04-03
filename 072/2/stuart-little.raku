#!/usr/bin/env raku

sub flns($l1, $l2, $flnm) {
    $flnm.IO.lines[($l1-1,$l2-1).min..($l1-1,$l2-1).max].join("\n")
}

say flns(|(3,6).map(*.Int), 'input.txt');
