#!/usr/bin/env raku

sub MAIN(
    @n = (1,2,4,2,4,1)
) {
    my $max = -∞;
    my $index;

    for @n.pairs -> $i {
        if $i.value > $max  {
            $max = $i.value;
            $index = $i.key;
        }
    }

    say $index;
}
