#!/usr/bin/env raku

my $use_csv = False;

sub MAIN () {
    my %counts;

    # Increment the counts hash for each line
    for 'example.txt'.IO.lines() -> $line {
        %counts{$line.chomp}++
    };

    # Print the aggregated line items
    for %counts.keys.sort -> $item {
        if ($use_csv) {
            # Normally i'd use a module like Text::CSV
            say $item ~ ',' ~ %counts{$item};
        } else {
            "%-10s %d\n".printf($item, %counts{$item});
        }
    }
}
