#!/usr/bin/env raku

sub consistent-strings(@_, $allowed) {
  my @allowed = $allowed.comb;
  @_.grep({ / ^ @allowed* $ / }).elems
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (<ad bd aaab baa badab>,     'ab'),  output => 2 },
        %{ input => (<a b c ab ac bc abc>,       'abc'), output => 7 },
        %{ input => (<cc acd b ba bac bad ac d>, 'cad'), output => 4 },
    ];

    for @tests {
        consistent-strings( |.<input> ).&is-deeply: .<output>, .<text>;

    }
#}
