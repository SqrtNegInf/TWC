#!/usr/bin/env raku

sub MAIN($N where $N ~~ Int && $N > 0 = 100) {
    my @pairs = (1..$N).combinations(2);
    say [+] @pairs.map(-> @pair { @pair[0] gcd @pair[1] });
}
