#!/usr/bin/env raku

#sub MAIN(Int $u, Int $v) {
    my ($u,$v) = 1, 2;
    my @ulams = $u, $v, $u + $v;

    while @ulams.elems < 10 {
        @ulams.push(
            @ulams
            .combinations(2)
            .map({ [+] $_; })
            .classify( { $_ }, into => my %freq )
            .keys
            .map({ $_.Int; })
            .grep({ %freq{$_}.elems < 2; })
            .grep({ $_ ∉ @ulams; })
            .min
        );
    }

    @ulams.join(q{, }).say;
#}
