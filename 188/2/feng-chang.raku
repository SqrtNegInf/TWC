#!/usr/bin/env raku

unit sub MAIN(UInt:D $x is copy = 4, UInt:D $y is copy = 6);

my UInt $cnt = 0;
while $x and $y {
    $x ≥ $y ?? ($x -= $y) !! ($y -= $x);
    ++$cnt;
}

put $cnt;
