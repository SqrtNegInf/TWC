#!/usr/bin/env raku
my ($A,$B) = 0, 200;
say ($A ^..^ $B).grep: { /^ <[01689]>+ $/ and $_ eq .flip.trans(“69” => “96”) }
