#!/usr/bin/env raku

sub MAIN(Int:D $rows where $rows ≥ 3 = 10) {
    my @rows;

    for 0..^($rows) -> $i {
        my @row;
        if ! $i {
            @row = 1;
        } else {
            @row.append: 1;
            @row.append: map { @rows[$i-1][$^a-1] + @rows[$i-1][$^a] }, 1..^$i;
            @row.append: 1;
        }
        @rows.push: @row;

        say ("  " x $rows - $i - 1) ~ @row.map( { $^a.fmt("%3d") } ).join(" ");
    }
}

