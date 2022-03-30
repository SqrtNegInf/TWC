#!/usr/bin/env raku

sub fstmiss(@a) {
    (1..*).grep({ ! @a.grep($_) }).first;
}

say fstmiss((5, 2, -2, 0));

# run as <script> num1 num2 ..
