#!/usr/bin/env raku

sub MAIN(
    @ints = [1, 2, 2, 4, 1, 5]
) {
    my %freq;

    for @ints -> $int {
        %freq{$int}++;
    }

    my $max = 0;
    my $output = 0;

    for %freq.kv -> $k, $v {
        if $v > $max {
            $max = $v;
            $output = 1;
        } elsif $v == $max {
            $output++;
        }
    }

    say $output;
}
