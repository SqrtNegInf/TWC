#!/usr/bin/env raku

sub MAIN(
    @ints= [1024, 512, 256, 128, 64]
) {
    my %ones;

    for @ints -> $i {
        %ones{$i} = $i.base(2).comb.grep({ $_ == 1 }).elems;
    }

    say q{(}, %ones.keys.sort({ %ones{$^a} <=> %ones{$^b} || $^a <=> $^b }).join(q{, }), q{)};
}
