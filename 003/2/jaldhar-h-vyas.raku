#!/usr/bin/env raku

# fixed formatting

multi sub MAIN(
    Int $height = 10,            #= the number of rows in the triangle
    ) {

    my &ptRow = -> $row, $col {
        $col == 1 || $col == $row
        ?? 1
        !! ptRow($row - 1, $col - 1) + ptRow($row - 1, $col)
    };

    for 1 .. $height -> $row {
        print ($row X (1 .. $row)).flat.map(&ptRow).join(' '), "\n";
    }
    print "\n";
}
