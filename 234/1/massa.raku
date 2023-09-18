#!/usr/bin/env raku

sub common-characters(@_) {
  ([∩] @_».comb».Bag).kv.map({ $^a xx $^b }).flat.sort
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => <java javascript julia>, output => <a j> },
        %{ input => <bella label roller>,    output => <e l l> },
        %{ input => <cool lock cook>,        output => <c o> },
    ];

    for @tests {
        common-characters( .<input> ).&is-deeply: .<output>, .<text>;
    }
#}
