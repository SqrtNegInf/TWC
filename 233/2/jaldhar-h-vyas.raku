#!/usr/bin/env raku

sub MAIN(
    @ints = (1,1,2,2,2,3)
) {
    my %freq = @ints.classify({$_});

    say q{(},
        %freq
            .keys
            .sort({ %freq{$^a}.elems <=> %freq{$^b}.elems || $^b <=> $^a })
            .map({ | %freq{$_} })
            .join(q{,}),
        q{)};
}
