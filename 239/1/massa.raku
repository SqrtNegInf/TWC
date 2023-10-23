#!/usr/bin/env raku

sub same-string(@_) {
  @_[0].join eq @_[1].join
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (<ab c>, <a bc>),     output => True },
        %{ input => (<ab c>, <ac b>),     output => False },
        %{ input => (<ab cd e>, <abcde>), output => True },
    ];

    for @tests {
        same-string( .<input> ).&is-deeply: .<output>, .<text>;
    }
#}
