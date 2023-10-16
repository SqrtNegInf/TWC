#!/usr/bin/env raku

my sub persistence($_) {
  .comb.elems > 1 and 1 + persistence([*] .comb)
}

sub persistence-sort(@_) {
  @_.sort.sort: *.&persistence
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests = [
        %{ input => (15, 99, 1, 34),  output => (1, 15, 34, 99) },
        %{ input => (50, 25, 33, 22), output => (22, 33, 50, 25) },
    ];

    for @tests {
        persistence-sort( .<input> ).&is-deeply: .<output>, .<text>;

    }
#}
