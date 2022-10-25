#!/usr/bin/env raku

use Test;

is <3 2 2>, magical-triplets <1 2 3 2>;
is Nil,     magical-triplets <1 3 2>;
is Nil,     magical-triplets <1 1 2 3>;
is <4 3 2>, magical-triplets <4 3 2>;

done-testing;

sub magical-triplets(@n) {
  my @triplets = @n.combinations(3).map( { |.permutations } ).
    grep({ .[0] + .[1] > .[2] && .[1] + .[2] > .[0] && .[0] + .[2] > .[1] }).
    sort({ not( .[0] ≥ .[1] ≥ .[2] ) });
  @triplets.map({ [+] $_ }).maxpairs.map({ @triplets[.key] }).head
}

