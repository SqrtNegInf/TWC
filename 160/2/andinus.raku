#!/usr/bin/env raku

unit sub MAIN(
    @n = [1, 3, 5, 7, 9 ]
);

for 0 .. @n.end -> $i {
    if @n[0 .. $i - 1].sum == @n[$i + 1 .. *].sum {
        put $i;
        exit;
    }
}
put -1;
