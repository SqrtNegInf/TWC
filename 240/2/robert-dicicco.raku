#!/usr/bin/env raku

my @myints = ([0, 2, 1, 5, 3, 4],[5, 0, 1, 2, 3, 4]);

for (@myints) -> @mints {
    my @out = ();
    say "Input: \@ints = ",[@mints];
    loop (my $cnt = 0; $cnt < @mints.elems; $cnt++ ) {
        push(@out, @mints[@mints[$cnt]]);
    }
    say "Output: ",[@out],"\n";
}
