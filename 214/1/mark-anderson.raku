#!/usr/bin/env raku
use Test;

is rank-score(<1 2 4 3 5>),                        <5 4 S B G>;
is rank-score(<8 5 6 7 4>),                        <G 4 B S 5>;
is rank-score(<3 5 4 2>),                          <B G S 4>;
is rank-score(<2 5 2 1 7 5 1>),                    <4 S 4 6 G S 6>;
is rank-score(<20 76 15 55 76 15 20 20 15 20 20>), <4 G 9 B G 9 4 4 9 4 4>;

multi rank-score($list where .elems == 1) { 'G' }

multi rank-score($list)
{
    my $b = $list.Bag;
    my @k = $b.keys.sort(-*);
    my @v = [\+] flat 1, $b{@k};

    @v[^3] .= map({ <Nil G S B>[$_] or $_ });
    my %h = @k Z=> @v;

    $list.map({ %h{$_} })
}
