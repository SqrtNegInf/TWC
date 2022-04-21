#!/usr/bin/env raku

sub generate_bar_graph(%data, $sort-on="value") {
    my $vmin = %data.values.min - 1;
    my $vmax = %data.values.max;
    constant $width = 79;

    my @count_array;
    if ($sort-on === "value") {
        @count_array = %data.sort(-*.value)>>.kv;
    } elsif ($sort-on === "key") {
        @count_array = %data.sort(*.key)>>.kv;
    } else {
        die "Unknown sorting argument: $sort-on";
    }

    for @count_array -> ($word, $count) {
        my $times = Int(($count - $vmin) / ($vmax - $vmin) * $width);
        say "$word:\t" ~ "#" x $times;
    }
}

my $data = { 'apple' => 3, 'cherry' => 2, 'banana' => 1 };

say "Sort on value";
generate_bar_graph($data, "value");

say "\nSort on key";
generate_bar_graph($data, "key");
