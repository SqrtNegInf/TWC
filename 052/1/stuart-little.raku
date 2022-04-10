#!/usr/bin/env raku

# not right!
sub isstep($n) {
    (($n.split('',:skip-empty) Z- $n.substr(1..*).split('',:skip-empty)).all ~~ *.abs==1).Bool
}

say (100..110).grep(&isstep);
