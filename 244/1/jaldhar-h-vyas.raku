#!/usr/bin/env raku

sub MAIN(
    @int = (8, 1, 2, 2, 3)
) {
    my %s;
    for @int.sort Z=> @int.keys -> $p {
        unless %s{$p.key}:exists {
            %s{$p.key} = $p.value;
        }
    }
    say q{(}, @int.map({ %s{$_} }).join(q{, }), q{)};
}
