#!/usr/bin/env raku

my @myints = ([3, 2, 1, 4],[3, 1],[2, 1, 3]);

for (@myints) -> @ints {
    say "Input: \@ints = ",@ints;
    print("Output: ");
    if @ints.elems <= 2  {
        say "-1\n";
        next;
    }
    my $min = min(@ints);
    my $max = max(@ints);
    print("( ");
    for @ints -> $i {
        print("$i ") if ($i > $min and $i < $max);
    }
    say ")\n";
}
