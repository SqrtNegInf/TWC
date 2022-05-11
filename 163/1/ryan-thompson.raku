#!/usr/bin/env raku

#| Calcuate bitwise AND unique pairs and sum the results
#  XXX - prefix: operators currently extend compile time.
sub prefix:<⊕>(*@n) {
    [+] @n.combinations(2).map({ [+&] $_ });
}

sub MAIN ( @n = <1 2 3 10> ) { 
    say ⊕ @n;
}
