#!/usr/bin/env raku

#our sub solution([$allowed, *@input]) is export {

my $allowed = 'ab';
my @input = <ad bd aaab baa badab>;
    my $allowed-chars = $allowed.comb.Set;
    say [+] @input.map: *.comb.Set ⊆ $allowed-chars;
#}
