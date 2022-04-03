#!/usr/bin/env raku

sub lines-range($filename, $a, $b) {
    $filename.IO.lines[($a-1)..($b-1)];
}

.say for lines-range("input.txt", 3, 6);
