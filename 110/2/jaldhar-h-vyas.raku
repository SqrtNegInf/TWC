#!/usr/bin/env raku

sub MAIN(
    Str $filename = 'example.csv'
) {
    my @table;
    for $filename.IO.lines -> $line {
        @table.push($line.split(q{,}));
    }

    (0 ..^ @table[0].elems).map({ @table[*;$_]; }).map({ $_.join(q{,}).say; });
}
